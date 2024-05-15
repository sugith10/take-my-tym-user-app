part of 'contract_service_bloc.dart';

sealed class ContractServiceState extends Equatable {
  const ContractServiceState();
  
  @override
  List<Object> get props => [];
}

final class ContractServiceInitial extends ContractServiceState {}

final class ContractServiceLoading  extends ContractServiceState {}

final class ContractServiceFinish  extends ContractServiceState {}

final class ContractServiceReport  extends ContractServiceState {}

final class ContractServiceError  extends ContractServiceState {}
