import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'oboarding_event.dart';
part 'oboarding_state.dart';

class OboardingBloc extends Bloc<OboardingEvent, OboardingState> {
  OboardingBloc() : super(OboardingInitial()) {
    on<OboardingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
