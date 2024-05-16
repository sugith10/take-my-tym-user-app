import 'package:flutter/cupertino.dart';

/// Checking mobile responsiveness based on device height.
class MobileResponsive {
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
