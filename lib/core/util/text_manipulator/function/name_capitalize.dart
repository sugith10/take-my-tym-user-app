part of '../taxt_manipulator.dart';

/// A utility class for capitalizing text.
final class _TextCapitalize {
  ///Capitalizes the first letter of the given string.
  static String capitalize(String name) {
    if (name.isEmpty) {
      return name;
    }
    return name.substring(0, 1).toUpperCase() + name.substring(1).toLowerCase();
  }
}
