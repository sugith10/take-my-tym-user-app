part of 'wallet_bloc.dart';

abstract class WalletState extends Equatable {
  const WalletState();  

  @override
  List<Object> get props => [];
}
class WalletInitial extends WalletState {}
