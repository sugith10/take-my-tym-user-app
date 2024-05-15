import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_logger.dart';
import '../../../data/datasources/contract_remote_data.dart';
import '../../../data/models/contract_model.dart';

part 'contracts_event.dart';
part 'contracts_state.dart';

class ContractsBloc extends Bloc<ContractsEvent, ContractsState> {
  bool type = true;
  ContractsBloc() : super(ContractsLoadingState()) {
    on<GetActiveContractsEvent>(_onGetActive);
    on<GetCompletedContractsEvent>(_onCompleted);
  }

  void _onGetActive(
    GetActiveContractsEvent event,
    Emitter<ContractsState> emit,
  ) async {
    type = true;
    try {
      emit(ContractsLoadingState());
      final data =
          await ContractRemoteData().activeContracts(userId: event.userId);
      final contractList = data.$1;
      final serviceProviderList = data.$2;
      emit(
        ContractsLoadedState(
          contractList: contractList,
          serviceProviderList: serviceProviderList,
        ),
      );
    } catch (e) {
      appLogger.e(e.toString());
      emit(ContractsErrorState());
    }
  }

  void _onCompleted(
    GetCompletedContractsEvent event,
    Emitter<ContractsState> state,
  ) async {
    type = false;
    try {
      emit(ContractsLoadingState());
      final data =
          await ContractRemoteData().completedContracts(userId: event.userId);
      final contractList = data.$1;
      final serviceProviderList = data.$2;
      emit(
        ContractsLoadedState(
          contractList: contractList,
          serviceProviderList: serviceProviderList,
        ),
      );
    } catch (e) {
      appLogger.e(e.toString());
      emit(ContractsErrorState());
    }
  }
}
