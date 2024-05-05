part of 'payment_bloc.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {}

final class PaymentSuccessState extends PaymentState {
  final double amount;

  const PaymentSuccessState({required this.amount});
}

final class PaymentFailState extends PaymentState {}
