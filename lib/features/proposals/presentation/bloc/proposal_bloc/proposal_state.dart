part of 'proposal_bloc.dart';

sealed class ProposalState extends Equatable {
  const ProposalState();
  
  @override
  List<Object> get props => [];
}

final class ProposalInitial extends ProposalState {}
