import 'package:cloud_firestore/cloud_firestore.dart';

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

final class _TimestampConvert {
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
