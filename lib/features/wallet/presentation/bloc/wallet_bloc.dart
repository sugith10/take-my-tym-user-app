import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/wallet/data/models/transaction_model.dart';
import 'package:take_my_tym/features/wallet/data/models/wallet_model.dart';
import 'package:take_my_tym/features/wallet/domain/usecases/wallet_use_case.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletLoadingState()) {
    final WalletUseCase walletUseCase = GetIt.instance<WalletUseCase>();
    on<WalletBalanceEvent>(
      (event, emit) async {
        emit(WalletInitialState());
        final WalletModel walletModel =
            await walletUseCase.walletBalance(uid: event.uid);
        emit(
          WalletLoadedState(
            balance: walletModel.balance,
            transactions: walletModel.transactions,
          ),
        );
      },
    );
  }
}
