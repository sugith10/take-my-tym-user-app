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
  final double balance;
  final List<TransactionModel> transactions;
  final String date;
  final String time;
  const WalletLoadedState({
    required this.balance,
    required this.transactions,
    required this.date,
    required this.time,
  });
  @override
  List<Object> get props => [balance, transactions];
}

final class WalletErrorState extends WalletState {}
