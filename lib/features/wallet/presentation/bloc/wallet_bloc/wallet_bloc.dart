import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:take_my_tym/core/util/app_error_msg.dart';
import 'package:take_my_tym/core/util/app_exception.dart';
import 'package:take_my_tym/core/util/app_logger.dart';
import 'package:take_my_tym/features/wallet/data/datasources/remote/wallet_remote_data.dart';
import 'package:take_my_tym/features/wallet/data/models/transaction_model.dart';
import 'package:take_my_tym/features/wallet/data/models/wallet_model.dart';
import 'package:take_my_tym/features/wallet/domain/usecases/wallet_use_case.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(const WalletInitialState(show: false)) {
    on<WalletBalanceEvent>(_onBalance);
    on<WalletTopUpEvent>(_onTopUp);
    on<WalletWithdrawEvent>(_onWithdraw);
    on<WalletTransferEvent>(_onTransfer);
  }

  void _onBalance(
    WalletBalanceEvent event,
    Emitter<WalletState> emit,
  ) async {
    // Emit an initial state with show set to false
    emit(const WalletInitialState(show: false));
    try {
      // Create an instance of local authentication
      final LocalAuthentication auth = LocalAuthentication();
      // Authenticate with the device
      final bool pass = await auth.authenticate(
        // Provide a localized reason for the authentication request
        localizedReason:
            "Confirm your screen lock PIN, Password or Fingerprint",
      );
      // If the authentication is successful
      if (pass) {
        // Emit a loading state
        emit(WalletLoadingState());

        // Get the wallet balance and transactions
        WalletModel walletModel =
            await GetIt.instance<WalletUseCase>().walletBalance(uid: event.uid);

        // Reverse the order of the transactions in the wallet model
        walletModel.transactions = walletModel.transactions.reversed.toList();

        // Get the current date and time
        final now = DateTime.now();
        // Emit a loaded state with the balance, transactions, and current date and time
        emit(
          WalletLoadedState(
            walletModel: walletModel,
            date: DateFormat('MMM dd, yyyy').format(now),
            time: DateFormat('h:mm a').format(now),
          ),
        );
      } else {
        // If the authentication is unsuccessful, emit an initial state with show set to true
        emit(const WalletInitialState(show: true));
      }
    } catch (e) {
      // Log any errors
      appLogger.f(e.toString());
    }
  }

  void _onTopUp(
    WalletTopUpEvent event,
    Emitter<WalletState> emit,
  ) async {
    try {
      // Create a new transaction model with the given amount and type
      final transactionModel = TransactionModel(
        timestamp: Timestamp.now(),
        amount: event.amount,
        transactionType: true,
      );

      // Top up the user's wallet with the given UID
      WalletModel walletModel = await WalletRemoteData().walletTopUp(
        uid: event.uid,
        transactionModel: transactionModel,
      );

      // Reverse the order of the transactions in the wallet model
      walletModel.transactions = walletModel.transactions.reversed.toList();

      // Get the current date and time
      final now = DateTime.now();
      // Emit the updated wallet state with the new balance and transactions
      emit(
        WalletLoadedState(
          walletModel: walletModel,
          date: DateFormat('MMM dd, yyyy').format(now),
          time: DateFormat('h:mm a').format(now),
        ),
      );
    } catch (e) {
      // Emit an error state if an exception is thrown
      emit(WalletErrorState(errorMsg: AppAlert(alert: e.toString())));
    }
  }

  void _onWithdraw(
    WalletWithdrawEvent event,
    Emitter<WalletState> emit,
  ) async {
    try {
      double convertedAmount = double.parse(event.amount);
      if (convertedAmount <= 0) {
        emit(WalletErrorState(errorMsg: AppAlert(alert: 'Invalid amount')));
        return;
      }
      if (event.walletModel != null) {
        if (convertedAmount > event.walletModel!.balance) {
          emit(WalletErrorState(
              errorMsg: AppAlert(alert: 'Insufficient balance')));
          return;
        }
      }

      final transactionModel = TransactionModel(
        timestamp: Timestamp.now(),
        amount: convertedAmount,
        transactionType: false,
      );

      WalletModel walletModel = await WalletRemoteData().walletWithdraw(
        uid: event.uid,
        transactionModel: transactionModel,
      );

      // Reverse the order of the transactions in the wallet model
      walletModel.transactions = walletModel.transactions.reversed.toList();

      final now = DateTime.now();

      emit(
        WalletLoadedState(
          walletModel: walletModel,
          date: DateFormat('MMM dd, yyyy').format(now),
          time: DateFormat('h:mm a').format(now),
        ),
      );
    } on AppException catch (e) {
      emit(WalletErrorState(errorMsg: AppAlert(alert: e.toString())));
    } catch (e) {
      emit(WalletErrorState(errorMsg: AppAlert(alert: e.toString())));
    }
  }

  void _onTransfer(
    WalletTransferEvent event,
    Emitter<WalletState> emit,
  ) async {
    double convertedAmount = double.parse(event.amount);
    final transactionModel = TransactionModel(
      timestamp: Timestamp.now(),
      amount: convertedAmount,
      transactionType: false,
    );
    try {
      final res = await WalletRemoteData().walletTransefer(
        uid: event.uid,
        transactionModel: transactionModel,
      );

      WalletModel walletModel = res.$1;

      // Reverse the order of the transactions in the wallet model
      walletModel.transactions = walletModel.transactions.reversed.toList();
      final transactionId = res.$2;
      emit(WalletTransferSuccessState(transactionId: transactionId));
      await Future.delayed(const Duration(seconds: 2));
      final now = DateTime.now();
      emit(WalletLoadedState(
        walletModel: walletModel,
        date: DateFormat('MMM dd, yyyy').format(now),
        time: DateFormat('h:mm a').format(now),
      ));
    } catch (e) {
      log("error: ${e.toString()}");
      emit(WalletErrorState(errorMsg: AppAlert(alert: e.toString())));
    }
  }
}
