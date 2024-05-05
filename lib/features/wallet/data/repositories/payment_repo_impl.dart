import 'package:take_my_tym/features/wallet/data/datasources/remote/stripe_payment.dart';
import 'package:take_my_tym/features/wallet/domain/repositories/payment_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  final StripePayment _stripe;

  PaymentRepoImpl(this._stripe);
  @override
  Future cardPayment({
    required String name,
    required String pin,
    required String city,
    required String state,
    required String amount,
    required String address,
  }) async {
    return await _stripe.createPaymentIntent(
      name: name,
      pin: pin,
      city: city,
      state: state,
      amount: amount,
      address: address,
    );
  }
}
