import 'package:cloud_firestore/cloud_firestore.dart';

part 'function/name_capitalize.dart';
part 'function/timestamp_convert.dart';

/// Utility class for manipulating text.
///
/// This class provides static methods for common text manipulation tasks,
/// such as capitalizing names and converting timestamps to readable formats.
class TextManipulator {
  // Private constructor to prevent instantiation.
  TextManipulator._();

  /// Capitalizes the first letter of the given string.
  ///
  /// [name] The string to capitalize.
  /// Returns the input string with the first letter capitalized.
  static String capitalize(String name) {
    return _NameCapitalize.capitalize(name);
  }

  /// Converts a [Timestamp] object to a string representing the time of day.
  ///
  /// [timestamp] The timestamp to convert.
  /// Returns a string representing the time of day (e.g., "3:45pm").
  static String timestampToTime(Timestamp timestamp) {
    return _TimestampConvert.timestampToTime(timestamp);
  }

  /// Converts a [Timestamp] object to a string representing the date.
  ///
  /// [timestamp] The timestamp to convert.
  /// Returns a string representing the date (e.g., "25 Dec 2024").
  static String timestampToDate(Timestamp timestamp) {
    return _TimestampConvert.timestampToDate(timestamp);
  }
}
