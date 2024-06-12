import 'package:take_my_tym/core/utils/app_logger.dart';

class WalletUtil {
  static bool convert(String amount) {
    try {
      if (amount.isEmpty) {
        return false;
      }
      final double value = double.parse(amount);
      if (value > 0) {
        return true;
      }
    } catch (e) {
      appLogger.e(e);
    }
    return false;
  }
}
