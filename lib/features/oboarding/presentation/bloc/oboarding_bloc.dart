import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'oboarding_event.dart';
part 'oboarding_state.dart';

class OboardingBloc extends Bloc<OboardingEvent, OboardingState> {
  OboardingBloc() : super(OboardingInitial()) {
    on<OboardingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
