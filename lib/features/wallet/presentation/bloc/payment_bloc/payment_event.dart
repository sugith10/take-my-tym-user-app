part of 'payment_bloc.dart';

class PaymentEvent extends Equatable {
  const PaymentEvent();
  @override
  List<Object> get props => [];
}

final class PaymentTopUpEvent extends PaymentEvent {
  final String amount;

  const PaymentTopUpEvent({required this.amount});
}

final class PaymentWithdrawEvent extends PaymentEvent {
  final String amount;

  const PaymentWithdrawEvent({required this.amount});
}
