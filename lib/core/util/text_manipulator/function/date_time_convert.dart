part of '../taxt_manipulator.dart';

/// A utility class for DateTime type conversions.
final class _DateTimeConvert {
  /// Converts a [DateTime] object to a string formatted as 'MMM yyyy (eg: May 2023)'.
  static String _date({required DateTime date}) {
    return DateFormat('MMM yyyy').format(date);
  }
}
