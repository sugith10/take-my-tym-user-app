part of 'submit_proposal_bloc.dart';

sealed class SubmitProposalState {
  const SubmitProposalState();
}

final class SubmitProposalInitial extends SubmitProposalState {}

final class SubmitProposalLoadingState extends SubmitProposalState {}

final class SubmitProposalErrorState extends SubmitProposalState {
  final AppErrorMsg error;
  const SubmitProposalErrorState({required this.error});
}

final class SubmitProposalSuccessState extends SubmitProposalState {}

final class SubmitProposalPageState extends SubmitProposalState {
  final int pageNumber;

  SubmitProposalPageState({required this.pageNumber});
}