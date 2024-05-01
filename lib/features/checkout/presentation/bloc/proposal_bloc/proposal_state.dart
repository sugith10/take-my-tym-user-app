part of 'proposal_bloc.dart';

sealed class ProposalState {
  const ProposalState();
}

final class ProposalInitial extends ProposalState {}

final class ProposalLoadingState extends ProposalState {}

final class ProposalErrorState extends ProposalState {
  final AppErrorMsg error;
  const ProposalErrorState({required this.error});
}

final class ProposalSuccessState extends ProposalState {}

final class ProposalPageState extends ProposalState {
  final int pageNumber;

  ProposalPageState({required this.pageNumber});
}