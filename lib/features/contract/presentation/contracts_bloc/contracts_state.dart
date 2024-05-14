part of 'contracts_bloc.dart';

sealed class ContractsState extends Equatable {
  const ContractsState();

  @override
  List<Object> get props => [];
}

final class ContractsInitialState extends ContractsState {}

final class ContractsLoadingState extends ContractsState {}

final class ContractsLoadedState extends ContractsState {
  final List<ContractModel> contractList;
  final List<ContractModel> serviceProviderList;

  const ContractsLoadedState({
    required this.contractList,
    required this.serviceProviderList,
  });

  @override
  List<Object> get props => [contractList, serviceProviderList];
}

final class ContractsErrorState extends ContractsState {}
