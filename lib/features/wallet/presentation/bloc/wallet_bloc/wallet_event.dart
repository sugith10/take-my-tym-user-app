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
  const WalletWithdrawEvent({
    required this.uid,
    required this.amount,
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
