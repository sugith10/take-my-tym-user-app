import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

part 'function/name_capitalize.dart';
part 'function/timestamp_convert.dart';
part 'function/date_time_convert.dart';
part 'function/aggressive_trim.dart';

/// Utility class for text manipulation.
class TextManipulator {
  TextManipulator._();

  /// Trims the leading and trailing whitespace from the given string.
  static String aggressiveTrim(String input) {
    return _AggressiveTrim.aggressiveTrim(input);
  }

  /// Capitalizes the first letter of the given string.
  static String capitalize(String name) {
    return _TextCapitalize.capitalize(name);
  }

  /// Converts a [Timestamp] to a string representing the time (e.g., "3:45pm").
  static String timestampToTime(Timestamp timestamp) {
    return _TimestampConvert.timestampToTime(timestamp);
  }

  /// Converts a [Timestamp] to a string representing the date (e.g., "25 Dec 2024").
  static String timestampToDate(Timestamp timestamp) {
    return _TimestampConvert.timestampToDate(timestamp);
  }

  /// Converts a [DateTime] to a string formatted as 'MMM yyyy (e.g., "Dec 2024")'.
  static String joinDate({required DateTime date}) {
    return _DateTimeConvert._date(date: date);
  }
}
