part of 'proposal_bloc.dart';

sealed class ProposalEvent extends Equatable {
  const ProposalEvent();

  @override
  List<Object> get props => [];
}

final class ProposalPageNavEvent extends ProposalEvent {
  final int index;
  const ProposalPageNavEvent({required this.index});

  @override
  List<Object> get props => [index];
}

final class ProposalSubmitEvent extends ProposalEvent {
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
