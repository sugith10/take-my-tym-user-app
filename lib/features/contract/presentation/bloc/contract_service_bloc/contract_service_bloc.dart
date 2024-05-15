import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/contract/data/models/contract_model.dart';

import '../../../data/datasources/contract_remote_data.dart';

part 'contract_service_event.dart';
part 'contract_service_state.dart';

class ContractServiceBloc
    extends Bloc<ContractServiceEvent, ContractServiceState> {
  ContractServiceBloc() : super(ContractServiceInitial()) {
    on<FinishContractServiceEvent>(_onFinish);
  }

  void _onFinish(
    FinishContractServiceEvent event,
    Emitter<ContractServiceState> emit,
  ) async {
    try {
      emit(ContractServiceLoading());
      final ContractModel contractModel =
          event.contractModel.copyWith(contractEnded: true);
      await ContractRemoteData().finishContract(contractModel: contractModel);
      emit(ContractServiceFinish());
    } catch (e) {
      appLogger.e(e);
      emit(ContractServiceError());
    }
  }
}
