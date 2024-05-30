import 'package:take_my_tym/core/utils/app_logger.dart';

double firebaseNumberToDouble(num firebaseNumber) {
  print("firebaseNumberToDouble");
  appLogger.f( {firebaseNumber});
  return firebaseNumber.toDouble();
}
