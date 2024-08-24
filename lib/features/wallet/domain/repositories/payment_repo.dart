abstract interface class PaymentRepo{
  Future cardPayment({
    required String name,
    required String pin,
    required String city,
    required String state,
    required String amount,
    required String address,
  });
}