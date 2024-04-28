import 'package:flutter/cupertino.dart';

class MobileResponsive {
  static bool mobileSmall(BuildContext context) =>
      MediaQuery.of(context).size.height < 830;

  static bool mobileMedium(BuildContext context) =>
      MediaQuery.of(context).size.height < 840;

  static bool mobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.height > 850;
}
