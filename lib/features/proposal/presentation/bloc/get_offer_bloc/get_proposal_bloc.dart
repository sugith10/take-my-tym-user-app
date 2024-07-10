import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/util/app_logger.dart';
import 'package:take_my_tym/features/proposal/data/datasources/remote/proposal_remote.dart';
import 'package:take_my_tym/features/proposal/data/models/proposal_model.dart';

part 'proposal_event.dart';
part 'proposal_state.dart';

class GetProposalBloc extends Bloc<ProposalEvent, ProposalState> {
  GetProposalBloc() : super(ProposalLoadingState()) {
    on<ProposalGetEvent>(_onGet);
  }

  void _onGet(
    ProposalGetEvent event,
    Emitter<ProposalState> emit,
  ) async {
    emit(ProposalLoadingState());
    try {
      final data = await ProposalRemote().getProposels(uid: event.uid);
      
      emit(ProposalSucessSate(proposalModel: data));
    } catch (e) {
      appLogger.d(e);
    }
  }
}
