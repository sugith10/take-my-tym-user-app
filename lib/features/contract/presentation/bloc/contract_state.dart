part of 'contract_bloc.dart';

abstract class ContractState extends Equatable {
  const ContractState();  

  @override
  List<Object> get props => [];
}
class ContractInitial extends ContractState {}
