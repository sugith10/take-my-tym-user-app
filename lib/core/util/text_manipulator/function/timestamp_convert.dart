part of '../taxt_manipulator.dart';

/// A utility class for Firebase [Timestamp] type conversions.
///
/// Provides methods to convert [Timestamp] objects to human-readable
/// date and time strings.
final class _TimestampConvert {
  /// Converts a [Timestamp] to a formatted time string (e.g., "3:45pm").
  static String timestampToTime(Timestamp timestamp) {
    //Convert the Timestamp object to a DateTime object
    DateTime dateTime = timestamp.toDate();
    //Create a String to store the period of the day (AM or PM)
    String period = dateTime.hour >= 12 ? 'pm' : 'am';
    //Create a variable to store the formatted hour of the day
    int hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    //Create a String to store the formatted time
    String formattedTime =
        '$hour:${dateTime.minute.toString().padLeft(2, '0')}$period';

    return formattedTime;
  }

  /// Converts a [Timestamp] to a formatted date string (e.g., "25 Dec 2024").
  static String timestampToDate(Timestamp timestamp) {
    // Convert the Timestamp to a DateTime
    DateTime dateTime = timestamp.toDate();

    // Format the DateTime as a string
    String formattedDate =
        '${dateTime.day} ${_getMonthName(dateTime.month)} ${dateTime.year}';

    return formattedDate;
  }

  static String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
