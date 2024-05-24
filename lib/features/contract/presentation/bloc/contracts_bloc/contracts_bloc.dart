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
      // Emit a loading state indicating we are fetching active contracts
      emit(ContractsLoadingState());

      // Fetch active contracts from the remote data source
      final data =
          await ContractRemoteData().activeContracts(userId: event.userId);

      // Extract the contract and service provider lists from the data
      final List<ContractModel> contractList = data.$1;
      final List<ContractModel> serviceProviderList = data.$2;

      // Emit a loaded state indicating we have fetched and loaded the contracts
      emit(
        ContractsLoadedState(
          contractList: contractList,
          serviceProviderList: serviceProviderList,
        ),
      );
    } catch (e) {
      // Log any errors that occur while fetching data
      appLogger.e(e.toString());

      // Emit an error state indicating an error occurred while fetching data
      emit(ContractsErrorState());
    }
  }

  void _onCompleted(
    GetCompletedContractsEvent event,
    Emitter<ContractsState> emit,
  ) async {
    type = false;
    try {
      // Emit the loading state
      emit(ContractsLoadingState());
      // Get the completed contracts from the remote data
      final data =
          await ContractRemoteData().completedContracts(userId: event.userId);
      // Get the list of contracts
      final contractList = data.$1;
      // Get the list of service providers
      final serviceProviderList = data.$2;
      // Emit the loaded state
      emit(
        ContractsLoadedState(
          contractList: contractList,
          serviceProviderList: serviceProviderList,
        ),
      );
    } catch (e) {
      // Log the error
      appLogger.e(e.toString());
      // Emit the error state
      emit(ContractsErrorState());
    }
  }
}
