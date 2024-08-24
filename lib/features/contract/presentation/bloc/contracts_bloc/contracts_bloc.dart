import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/app_logger.dart';
import '../../../data/datasources/contract_remote_data.dart';
import '../../../data/models/contract_model.dart';

part 'contracts_event.dart';
part 'contracts_state.dart';

/// Bloc that handles fetching and managing contracts.
class ContractsBloc extends Bloc<ContractsEvent, ContractsState> {
  /// [type] is a boolean variable that indicates,
  /// Whether the bloc is handling active or completed contracts.
  /// Used in the Contract Page's Active and Completed tabs to display relevant information.
  bool _type = true;
  bool get type => _type;

  ContractsBloc() : super(ContractsLoadingState()) {
    on<GetActiveContractsEvent>(_onGetActive);
    on<GetCompletedContractsEvent>(_onCompleted);
  }

  /// Handles [GetActiveContractsEvent] to fetch active contracts.
  void _onGetActive(
    GetActiveContractsEvent event,
    Emitter<ContractsState> emit,
  ) async {
    _type = true;
    try {
      emit(ContractsLoadingState());

      // Fetch active contracts from the remote data source
      final data =
          await ContractRemoteData().activeContracts(userId: event.userId);

      // Extract the contract and service provider lists from the data
      final List<ContractModel> contractList = data.$1;
      final List<ContractModel> serviceProviderList = data.$2;

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

  /// Handles [GetCompletedContractsEvent] to fetch active contracts.
  void _onCompleted(
    GetCompletedContractsEvent event,
    Emitter<ContractsState> emit,
  ) async {
    _type = false;
    try {
      emit(ContractsLoadingState());
      // Fetch completed contracts from the remote data
      final data =
          await ContractRemoteData().completedContracts(userId: event.userId);
      // Get the list of contracts
      final contractList = data.$1;
      // Get the list of service providers
      final serviceProviderList = data.$2;

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
