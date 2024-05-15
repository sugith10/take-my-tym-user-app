part of 'get_proposal_bloc.dart';

sealed class ProposalEvent extends Equatable {
  const ProposalEvent();

  @override
  List<Object> get props => [];
}

final class ProposalGetEvent extends ProposalEvent {
  final String uid;
  const ProposalGetEvent({required this.uid});
}