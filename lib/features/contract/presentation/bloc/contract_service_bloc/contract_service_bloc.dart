import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/contract/data/models/contract_model.dart';

import '../../../data/datasources/contract_remote_data.dart';

part 'contract_service_event.dart';
part 'contract_service_state.dart';

class ContractServiceBloc
    extends Bloc<ContractServiceEvent, ContractServiceState> {
  final bool contractType = true;
   
  ContractServiceBloc() : super(ContractServiceInitial()) {
    on<FinishContractServiceEvent>(_onFinish);
  }

 /// Manages the finishing of a contract service, marking it as finished.
  void _onFinish(
    FinishContractServiceEvent event,
    Emitter<ContractServiceState> emit,
  ) async {
    try {
      // Emit ContractServiceLoading state
      emit(ContractServiceLoading());
      // Create a new ContractModel with contractEnded set to true
      final ContractModel contractModel =
          event.contractModel.copyWith(contractEnded: true);
      // Call the finishContract method on ContractRemoteData
      await ContractRemoteData().finishContract(contractModel: contractModel);
      // Emit ContractServiceFinish state
      emit(ContractServiceFinish());
    } catch (e) {
      // Log the error
      appLogger.e(e);
      // Emit ContractServiceError state
      emit(ContractServiceError());
    }
  }
}
