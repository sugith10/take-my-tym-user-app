part of '../taxt_manipulator.dart';

final class _NameCapitalize {
  static String capitalize(String name) {
    // If the given string is empty, return it as is.
    if (name.isEmpty) {
      return name;
    }
    // Return the first letter of the string in uppercase and the rest of the string in lowercase.
    return name.substring(0, 1).toUpperCase() + name.substring(1).toLowerCase();
  }
}