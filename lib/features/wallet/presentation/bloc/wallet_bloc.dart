import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletInitial()) {
    on<WalletEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
