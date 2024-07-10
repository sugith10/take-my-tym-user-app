import 'package:flutter/cupertino.dart';

/// Utility class for checking mobile responsiveness based on device height.
///
/// This class provides static methods to determine if the device has a small,
/// medium, or large mobile screen based on its height. It cannot be instantiated.
class MobileResponsive {
  MobileResponsive._();

  /// Indicating a small mobile screen.
  static bool mobileSmall(BuildContext context) =>
      MediaQuery.of(context).size.height < 830;

  /// Indicating a medium-sized mobile screen.
  static bool mobileMedium(BuildContext context) =>
      MediaQuery.of(context).size.height < 840;

  /// Indicating a large mobile screen.
  static bool mobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.height > 850;
}
