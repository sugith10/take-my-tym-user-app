import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/wallet/domain/usecases/payment_use_case.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentTopUpEvent>(_onTopUp);
    on<PaymentWithdrawEvent>(_onWithdraw);
  }

  void _onTopUp(
    PaymentTopUpEvent event,
    Emitter<PaymentState> emit,
  ) async {
    try {
      double convertedAmount = double.parse(event.amount);
      int amount = convertedAmount.toInt();

      await initPaymentSheet(amount: amount.toString());
      await Stripe.instance.presentPaymentSheet();

      emit(PaymentSuccessState(amount: convertedAmount));
    } catch (e) {
      emit(PaymentFailState());
    }
  }

  void _onWithdraw(
    PaymentWithdrawEvent event,
    Emitter<PaymentState> emit,
  ) async {
    try {} catch (e) {
      emit(PaymentFailState());
    }
  }

  Future<void> initPaymentSheet({required String amount}) async {
    try {
      // 1. create payment intent on the client side by calling stripe api
      final payment = GetIt.instance<PaymentUseCase>();

      final data = await payment.cardPayment(
        name: 'Sugith',
        address: 'Kodappurath House',
        pin: "432515",
        amount: (int.parse(amount) * 100).toString(),
        city: 'San Francisco',
        state: 'CA',
      );

      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: false,
          // Main params
          merchantDisplayName: 'Flutter Stripe Store Demo',
          paymentIntentClientSecret: data['client_secret'],
          // Customer keys
          customerEphemeralKeySecret: data['ephemeralKey'],
          customerId: data['id'],
          style: ThemeMode.light,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
