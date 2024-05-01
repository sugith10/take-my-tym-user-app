import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';

part 'proposal_event.dart';
part 'proposal_state.dart';

class ProposalBloc extends Bloc<ProposalEvent, ProposalState> {
  ProposalBloc() : super(ProposalInitial()) {
    on<ProposalPageNavEvent>(
      (event, emit){
        
        emit(ProposalPageState(pageNumber: event.index));
      },
    );

    on<ProposalSubmitEvent>(
      (event, emit) {
        final message = event.message.trim();
        if (message.length < 5) {
          final AppErrorMsg appError = AppErrorMsg(
            title: 'Please provide a proper messsage.',
            content: "Without proper message you can't a proposel...",
          );
          emit(ProposalErrorState(error: appError));
        } else {}
      },
    );
  }
}
