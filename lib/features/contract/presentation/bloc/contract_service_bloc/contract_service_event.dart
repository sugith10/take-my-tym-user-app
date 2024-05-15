part of 'contract_service_bloc.dart';

sealed class ContractServiceEvent extends Equatable {
  const ContractServiceEvent();

  @override
  List<Object> get props => [];
}

final class FinishContractServiceEvent extends ContractServiceEvent {
  final ContractModel contractModel;

  const FinishContractServiceEvent({
    required this.contractModel,
  });

  @override
  List<Object> get props => [contractModel];
}

final class ComplaintContractServiceEvent extends ContractServiceEvent {
  final ContractModel contractModel;
  final String msg;

  const ComplaintContractServiceEvent({
    required this.contractModel,
    required this.msg,
  });

  @override
  List<Object> get props => [contractModel, msg];
}
