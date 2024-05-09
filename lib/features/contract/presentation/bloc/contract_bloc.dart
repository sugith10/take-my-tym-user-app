import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contract_event.dart';
part 'contract_state.dart';

class ContractBloc extends Bloc<ContractEvent, ContractState> {
  ContractBloc() : super(ContractInitial()) {
    on<ContractEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
