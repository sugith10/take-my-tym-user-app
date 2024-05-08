import 'package:cloud_firestore/cloud_firestore.dart';

String timestampToTime(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  String period = dateTime.hour >= 12 ? 'pm' : 'am';
  int hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
  String formattedTime = '$hour:${dateTime.minute.toString().padLeft(2, '0')}$period';
  return formattedTime;
}
