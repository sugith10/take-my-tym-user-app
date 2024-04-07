import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'individual_message_event.dart';
part 'individual_message_state.dart';

class IndividualMessageBloc
    extends Bloc<IndividualMessageEvent, IndividualMessageState> {
  IndividualMessageBloc() : super(IndividualMessageInitial()) {
    on<IndividualMessageEvent>(
      (event, emit) {},
    );
  }
}
