import 'package:take_my_tym/features/wallet/domain/repositories/payment_repo.dart';

class PaymentUseCase {
  final PaymentRepo _paymentRepo;

  const PaymentUseCase(this._paymentRepo);

  Future cardPayment({
    required String name,
    required String pin,
    required String city,
    required String state,
    required String amount,
    required String address,
  }) async {
    return await _paymentRepo.cardPayment(
      name: name,
      pin: pin,
      city: city,
      state: state,
      amount: amount,
      address: address,
    );
  }
}
