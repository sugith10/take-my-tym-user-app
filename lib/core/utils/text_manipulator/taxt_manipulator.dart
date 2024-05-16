import 'package:cloud_firestore/cloud_firestore.dart';

part 'function/name_capitalize.dart';
part 'function/timestamp_convert.dart';

/// Utility class for manipulating text.
class TextManipulator {
  /// Capitalizes the first letter of the given string.
  static String capitalize(String name) {
    return _NameCapitalize.capitalize(name);
  }

  ///This function takes a Timestamp object and returns a String representing the time of day
  static String timestampToTime(Timestamp timestamp) {
    return _TimestampConvert.timestampToTime(timestamp);
  }

  ///This function takes a Timestamp object and returns a String representing the time
  static String timestampToDate(Timestamp timestamp) {
    return _TimestampConvert.timestampToDate(timestamp);
  }
}

