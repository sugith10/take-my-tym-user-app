// Copyright 2023 The Abseil Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// -----------------------------------------------------------------------------
// File: no_destructor.h
// -----------------------------------------------------------------------------
//
// This header file defines the absl::NoDestructor<T> wrapper for defining a
// static type that does not need to be destructed upon program exit. Instead,
// such an object survives during program exit (and can be safely accessed at
// any time).
//
// Objects of such type, if constructed safely and under the right conditions,
// provide two main benefits over other alternatives:
//
//   * Global objects not normally allowed due to concerns of destruction order
//     (i.e. no "complex globals") can be safely allowed, provided that such
//     objects can be constant initialized.
//   * Function scope static objects can be optimized to avoid heap allocation,
//     pointer chasing, and allow lazy construction.
//
// See below for complete details.


#ifndef ABSL_BASE_NO_DESTRUCTOR_H_
#define ABSL_BASE_NO_DESTRUCTOR_H_

#include <new>
#include <type_traits>
#include <utility>

#include "absl/base/config.h"

namespace absl {
ABSL_NAMESPACE_BEGIN

// absl::NoDestructor<T>
//
// NoDestructor<T> is a wrapper around an object of type T that behaves as an
// object of type T but never calls T's destructor. NoDestructor<T> makes it
// safer and/or more efficient to use such objects in static storage contexts:
// as global or function scope static variables.
//
// An instance of absl::NoDestructor<T> has similar type semantics to an
// instance of T:
//
// * Constructs in the same manner as an object of type T through perfect
//   forwarding.
// * Provides pointer/reference semantic access to the object of type T via
//   `->`, `*`, and `get()`.
//   (Note that `const NoDestructor<T>` works like a pointer to const `T`.)
//
// An object of type NoDestructor<T> should be defined in static storage:
// as either a global static object, or as a function scope static variable.
//
// Additionally, NoDestructor<T> provides the following benefits:
//
// * Never calls T's destructor for the object
// * If the object is a function-local static variable, the type can be
//   lazily constructed.
//
// An object of type NoDestructor<T> is "trivially destructible" in the notion
// that its destructor is never run. Provided that an object of this type can be
// safely initialized and does not need to be cleaned up on program shutdown,
// NoDestructor<T> allows you to define global static variables, since Google's
// C++ style guide ban on such objects doesn't apply to objects that are
// trivially destructible.
//
// Usage as Global Static Variables
//
// NoDestructor<T> allows declaration of a global object with a non-trivial
// constructor in static storage without needing to add a destructor.
// However, such objects still need to worry about initialization order, so
// such objects should be const initialized:
//
//    // Global or namespace scope.
//    ABSL_CONST_INIT absl::NoDestructor<MyRegistry> reg{"foo", "bar", 8008};
//
// Note that if your object already has a trivial destructor, you don't need to
// use NoDestructor<T>.
//
// Usage as Function Scope Static Variables
//
// Function static objects will be lazily initialized within static storage:
//
//    // Function scope.
//    const std::string& MyString() {
//      static const absl::NoDestructor<std::string> x("foo");
//      return *x;
//    }
//
// For function static variables, NoDestructor avoids heap allocation and can be
// inlined in static storage, resulting in exactly-once, thread-safe
// construction of an object, and very fast access thereafter (the cost is a few
// extra cycles).
//
// Using NoDestructor<T> in this manner is generally better than other patterns
// which require pointer chasing:
//
//   // Prefer using absl::NoDestructor<T> instead for the static variable.
//   const std::string& MyString() {
//     static const std::string* x = new std::string("foo");
//     return *x;
//   }
//
template <typename T>
class NoDestructor {
 public:
  // Forwards arguments to the T's constructor: calls T(args...).
  template <typename... Ts,
            // Disable this overload when it might collide with copy/move.
            typename std::enable_if<!std::is_same<void(std::decay_t<Ts>&...),
                                                  void(NoDestructor&)>::value,
                                    int>::type = 0>
  explicit constexpr NoDestructor(Ts&&... args)
      : impl_(std::forward<Ts>(args)...) {}

  // Forwards copy and move construction for T. Enables usage like this:
  //   static NoDestructor<std::array<string, 3>> x{{{"1", "2", "3"}}};
  //   static NoDestructor<std::vector<int>> x{{1, 2, 3}};
  explicit constexpr NoDestructor(const T& x) : impl_(x) {}
  explicit constexpr NoDestructor(T&& x)
      : impl_(std::move(x)) {}

  // No copying.
  NoDestructor(const NoDestructor&) = delete;
  NoDestructor& operator=(const NoDestructor&) = delete;

  // Pretend to be a smart pointer to T with deep constness.
  // Never returns a null pointer.
  T& operator*() { return *get(); }
  T* operator->() { return get(); }
  T* get() { return impl_.get(); }
  const T& operator*() const { return *get(); }
  const T* operator->() const { return get(); }
  const T* get() const { return impl_.get(); }

 private:
  class DirectImpl {
   public:
    template <typename... Args>
    explicit constexpr DirectImpl(Args&&... args)
        : value_(std::forward<Args>(args)...) {}
    const T* get() const { return &value_; }
    T* get() { return &value_; }

   private:
    T value_;
  };

  class PlacementImpl {
   public:
    template <typename... Args>
    explicit PlacementImpl(Args&&... args) {
      new (&space_) T(std::forward<Args>(args)...);
    }
    const T* get() const {
      return Launder(reinterpret_cast<const T*>(&space_));
    }
    T* get() { return Launder(reinterpret_cast<T*>(&space_)); }

   private:
    template <typename P>
    static P* Launder(P* p) {
#if defined(__cpp_lib_launder) && __cpp_lib_launder >= 201606L
      return std::launder(p);
#elif ABSL_HAVE_BUILTIN(__builtin_launder)
      return __builtin_launder(p);
#else
      // When `std::launder` or equivalent are not available, we rely on
      // undefined behavior, which works as intended on Abseil's officially
      // supported platforms as of Q3 2023.
#if defined(__GNUC__) && !defined(__clang__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wstrict-aliasing"
#endif
      return p;
#if defined(__GNUC__) && !defined(__clang__)
#pragma GCC diagnostic pop
#endif
#endif
    }

    alignas(T) unsigned char space_[sizeof(T)];
  };

  // If the object is trivially destructible we use a member directly to avoid
  // potential once-init runtime initialization. It somewhat defeats the
  // purpose of NoDestructor in this case, but this makes the class more
  // friendly to generic code.
  std::conditional_t<std::is_trivially_destructible<T>::value, DirectImpl,
                     PlacementImpl>
      impl_;
};

#ifdef ABSL_HAVE_CLASS_TEMPLATE_ARGUMENT_DEDUCTION
// Provide 'Class Template Argument Deduction': the type of NoDestructor's T
// will be the same type as the argument passed to NoDestructor's constructor.
template <typename T>
NoDestructor(T) -> NoDestructor<T>;
#endif  // ABSL_HAVE_CLASS_TEMPLATE_ARGUMENT_DEDUCTION

ABSL_NAMESPACE_END
}  // namespace absl

#endif  // ABSL_BASE_NO_DESTRUCTOR_H_
