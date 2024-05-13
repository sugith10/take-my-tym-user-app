import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/wallet/data/datasources/remote/wallet_remote_data.dart';
import 'package:take_my_tym/features/wallet/data/models/transaction_model.dart';
import 'package:take_my_tym/features/wallet/data/models/wallet_model.dart';
import 'package:take_my_tym/features/wallet/domain/usecases/wallet_use_case.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletUseCase _useCase;
  WalletBloc(this._useCase) : super(const WalletInitialState(show: false)) {
    on<WalletBalanceEvent>(_onBalance);
    on<WalletTopUpEvent>(_onTopUp);
    on<WalletWithdrawEvent>(_onWithdraw);
    on<WalletTransferEvent>(_onTransfer);
  }

  void _onBalance(
    WalletBalanceEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletInitialState(show: false));
    try {
      final LocalAuthentication auth = LocalAuthentication();
      final bool pass = await auth.authenticate(
        localizedReason:
            "Confirm your screen lock PIN, Password or Fingerprint",
      );
      if (pass) {
        emit(WalletLoadingState());
        final WalletModel walletModel =
            await _useCase.walletBalance(uid: event.uid);
        final now = DateTime.now();
        emit(
          WalletLoadedState(
            balance: walletModel.balance,
            transactions: walletModel.transactions.reversed.toList(),
            date: DateFormat('MMM dd, yyyy').format(now),
            time: DateFormat('h:mm a').format(now),
          ),
        );
      } else {
        emit(const WalletInitialState(show: true));
      }
    } catch (e) {
      appLogger.f(e.toString());
    }
  }

  void _onTopUp(
    WalletTopUpEvent event,
    Emitter<WalletState> emit,
  ) async {
    try {
      final transactionModel = TransactionModel(
        timestamp: Timestamp.now(),
        amount: event.amount,
        transactionType: true,
      );

      final walletModel = await WalletRemoteData().walletTopUp(
        uid: event.uid,
        transactionModel: transactionModel,
      );
      final now = DateTime.now();
      emit(
        WalletLoadedState(
          balance: walletModel.balance,
          transactions: walletModel.transactions.reversed.toList(),
          date: DateFormat('MMM dd, yyyy').format(now),
          time: DateFormat('h:mm a').format(now),
        ),
      );
    } catch (e) {
      emit(WalletErrorState(errorMsg: AppErrorMsg(title: e.toString())));
    }
  }

  void _onWithdraw(
    WalletWithdrawEvent event,
    Emitter<WalletState> emit,
  ) async {
    try {
      double convertedAmount = double.parse(event.amount);

      final transactionModel = TransactionModel(
        timestamp: Timestamp.now(),
        amount: convertedAmount,
        transactionType: false,
      );

      final walletModel = await WalletRemoteData().walletWithdraw(
        uid: event.uid,
        transactionModel: transactionModel,
      );
      final now = DateTime.now();
      emit(
        WalletLoadedState(
          balance: walletModel.balance,
          transactions: walletModel.transactions.reversed.toList(),
          date: DateFormat('MMM dd, yyyy').format(now),
          time: DateFormat('h:mm a').format(now),
        ),
      );
    } on AppException catch (e) {
      emit(WalletErrorState(errorMsg: AppErrorMsg(title: e.toString())));
    } catch (e) {
      emit(WalletErrorState(errorMsg: AppErrorMsg(title: e.toString())));
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
      final walletModel = res.$1;
      final transactionId = res.$2;
      emit(WalletTransferSuccessState(transactionId: transactionId));
      await Future.delayed(const Duration(seconds: 2));
      final now = DateTime.now();
      emit(WalletLoadedState(
        balance: walletModel.balance,
        transactions: walletModel.transactions,
        date: DateFormat('MMM dd, yyyy').format(now),
        time: DateFormat('h:mm a').format(now),
      ));
    } catch (e) {
     log( "error: ${e.toString()}");
      emit(WalletErrorState(errorMsg: AppErrorMsg(title: e.toString())));
    }
  }
}
