import 'package:cloud_firestore/cloud_firestore.dart';

class MessageTimeUtil {
  MessageTimeUtil._();
  // Converts a [Timestamp] to a formatted time string (e.g., "3:45pm").
  static String timestampToTime(Timestamp timestamp) {
    //Convert the Timestamp object to a DateTime object
    DateTime dateTime = timestamp.toDate();

    DateTime currentDate = DateTime.now();

    if (currentDate.day == dateTime.day &&
        currentDate.month == dateTime.month &&
        currentDate.year == dateTime.year) {
      //Create a String to store the period of the day (AM or PM)
      String period = dateTime.hour >= 12 ? 'pm' : 'am';
      //Create a variable to store the formatted hour of the day
      int hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
      //Create a String to store the formatted time
      String formattedTime =
          '$hour:${dateTime.minute.toString().padLeft(2, '0')}$period';

      return formattedTime;
    } else if (currentDate.day - 1 == dateTime.day &&
        currentDate.month == dateTime.month &&
        currentDate.year == dateTime.year) {
      //If the message was sent yesterday
      return "Yesterday";
    }

    //Create a String to store the formatted date (e.g., "3/15/2022")
    String date = '${dateTime.day}/${dateTime.month}/${dateTime.year}';

    return date;
  }

 static bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

}
