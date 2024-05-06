import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/features/wallet/data/datasources/remote/wallet_remote_data.dart';
import 'package:take_my_tym/features/wallet/data/models/transaction_model.dart';
import 'package:take_my_tym/features/wallet/data/models/wallet_model.dart';
import 'package:take_my_tym/features/wallet/domain/usecases/wallet_use_case.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletUseCase _useCase;
  WalletBloc(this._useCase) : super(WalletLoadingState()) {
    on<WalletBalanceEvent>(_onBalance);
    on<WalletTopUpEvent>(_onTopUp);
    on<WalletWithdrawEvent>(_onWithdraw);
    on<WalletTransferEvent>(_onTransfer);
  }

  void _onBalance(
    WalletBalanceEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(WalletLoadingState());
    final WalletModel walletModel =
        await _useCase.walletBalance(uid: event.uid);
    emit(
      WalletLoadedState(
        balance: walletModel.balance,
        transactions: walletModel.transactions.reversed.toList(),
      ),
    );
  }

  void _onTopUp(
    WalletTopUpEvent event,
    Emitter<WalletState> emit,
  ) async {
    final transactionModel = TransactionModel(
      timestamp: Timestamp.now(),
      amount: event.amount,
      transactionType: true,
    );

    final walletModel = await WalletRemoteData().walletTopUp(
      uid: event.uid,
      transactionModel: transactionModel,
    );

    emit(
      WalletLoadedState(
        balance: walletModel.balance,
        transactions: walletModel.transactions.reversed.toList(),
      ),
    );
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

      emit(
        WalletLoadedState(
          balance: walletModel.balance,
          transactions: walletModel.transactions.reversed.toList(),
        ),
      );
    } catch (e) {}
  }

  void _onTransfer(WalletTransferEvent event, Emitter<WalletState> emit) {}
}
