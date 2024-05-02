part of 'wallet_bloc.dart';

sealed class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => [];
}

final class WalletBalanceEvent extends WalletEvent {
  final String uid;
const  WalletBalanceEvent({required this.uid});
}
