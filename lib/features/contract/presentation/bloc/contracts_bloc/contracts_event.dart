part of 'contracts_bloc.dart';

sealed class ContractsEvent extends Equatable {
  const ContractsEvent();

  @override
  List<Object> get props => [];
}

final class GetActiveContractsEvent extends ContractsEvent{
  final String userId;
  const GetActiveContractsEvent({required this.userId});
}

final class GetCompletedContractsEvent extends ContractsEvent{
   final String userId;
  const GetCompletedContractsEvent({required this.userId});
}
