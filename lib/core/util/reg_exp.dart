/// A utility class for commonly used regular expressions.
final class RegExpUtil {
  RegExpUtil._();

  // Regular expression to validate email
  static RegExp emailRexExp = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');

  // Regular expression to validate password
  static RegExp passwordRexExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$');

  // Regular expression to validate special characters
  static RegExp specialCharRexExp =
      RegExp(r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])');

  // Regular expression to validate name
  static RegExp nameRexExp = RegExp(r'^[a-zA-Z]+$');
}
