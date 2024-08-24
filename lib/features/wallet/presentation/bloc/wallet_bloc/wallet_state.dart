part of 'wallet_bloc.dart';

sealed class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

final class WalletInitialState extends WalletState {
  final bool show;
  const WalletInitialState({required this.show});

  @override
  List<Object> get props => [show];
}

final class WalletLoadingState extends WalletState {}

final class WalletLoadedState extends WalletState {
  final WalletModel walletModel;
  final String date;
  final String time;
  const WalletLoadedState({
    required this.walletModel,
    required this.date,
    required this.time,
  });
  @override
  List<Object> get props => [walletModel];
}

final class WalletErrorState extends WalletState {
  final AppAlert  errorMsg;

  const WalletErrorState({required this.errorMsg});
}

final class WalletTransferSuccessState extends WalletState {
  final String transactionId;

  const WalletTransferSuccessState({required this.transactionId});
}
