part of 'wallet_bloc.dart';

sealed class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

final class WalletInitialState extends WalletState {}

final class WalletLoadingState extends WalletState {}

final class WalletLoadedState extends WalletState {
  final double balance;
  final List<TransactionModel> transactions;
  const WalletLoadedState({
    required this.balance,
    required this.transactions,
  });
}

final class WalletErrorState extends WalletState {}
