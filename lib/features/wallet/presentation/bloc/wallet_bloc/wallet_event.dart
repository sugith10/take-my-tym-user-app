part of 'wallet_bloc.dart';

sealed class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => [];
}

final class WalletBalanceEvent extends WalletEvent {
  final String uid;
  const WalletBalanceEvent({required this.uid});
}

final class WalletTopUpEvent extends WalletEvent {
  final String uid;
  final double amount;
  const WalletTopUpEvent({
    required this.uid,
    required this.amount,
  });
}

final class WalletWithdrawEvent extends WalletEvent {
  final String uid;
  final String amount;
  final WalletModel? walletModel;
  const WalletWithdrawEvent({
    required this.uid,
    required this.amount,
     this.walletModel,
  });
}

final class WalletTransferEvent extends WalletEvent {
  final String uid;
  final String amount;
  const WalletTransferEvent({
    required this.uid,
    required this.amount,
  });
}
