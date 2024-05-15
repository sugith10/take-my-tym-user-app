part of 'submit_proposal_bloc.dart';

sealed class SubmitProposalEvent extends Equatable {
  const SubmitProposalEvent();

  @override
  List<Object> get props => [];
}

final class SubmitProposalPagEvent extends SubmitProposalEvent {
  final int index;
  const SubmitProposalPagEvent({required this.index});

  @override
  List<Object> get props => [index];
}

final class ProposalSubmitEvent extends SubmitProposalEvent {
  final String message;
  final String uid;

  final PostModel postModel;
  const ProposalSubmitEvent(
      {required this.uid,
  
      required this.postModel,
      required this.message});

  @override
  List<Object> get props => [message];
}
