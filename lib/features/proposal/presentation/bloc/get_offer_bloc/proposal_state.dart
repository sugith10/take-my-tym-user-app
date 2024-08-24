part of 'get_proposal_bloc.dart';

sealed class ProposalState extends Equatable {
  const ProposalState();

  @override
  List<Object> get props => [];
}

final class ProposalInitial extends ProposalState {}

final class ProposalLoadingState extends ProposalState {}

final class ProposalSucessSate extends ProposalState {
  final ProposalModel proposalModel;
  const ProposalSucessSate({required this.proposalModel});
}

final class ProposalFailState extends ProposalState {
  
}
