import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'success_page_event.dart';
part 'success_page_state.dart';

// Define the initial time left for the success page
const int _initialTimeLeft = 5;

/// Manages the timer state on the success page.
class SuccessPageBloc extends Bloc<SuccessPageEvent, SuccessPageState> {
  // Timer variable
  late Timer _timer;

  SuccessPageBloc()
      : super(const SuccessPageTimeLeftState(timeLeft: _initialTimeLeft)) {
    // Start the timer with the initial time left
    _startTimer(initialTimeLeft: _initialTimeLeft);

    /// [SuccessCountStartEvent] is never called directly in the bloc
    /// It's handled by the bloc itself in the [_startTimer] function
    on<SuccessCountStartEvent>(
      (event, emit) async {
        // If the time left is less than or equal to 0
        if (event.timeLeft <= 0) {
          // Cancel the timer
          _timer.cancel();
          // The [SuccessPageBloc] will closed and
          // The [SuccessPageExistState] will be emitted
          return emit(SuccessPageExistState());
        } else {
          // Otherwise, emit the SuccessPageTimeLeftState with the updated time left
          emit(SuccessPageTimeLeftState(timeLeft: event.timeLeft));
        }
      },
    );

    /// [SuccessCountEndEvent] is called when
    /// The user want to stop count manually.
    on<SuccessCountEndEvent>((event, emit) async {
      // Cancel the timer
      _timer.cancel();
      // The [SuccessPageBloc] will closed and
      // The [SuccessPageExistState] will be emitted
      return emit(SuccessPageExistState());
    });
  }

  // Start the timer
  void _startTimer({required int initialTimeLeft}) {
    // Declare the time left variable
    int timeLeft = initialTimeLeft;

    // Start the timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Decrement the time left
      timeLeft--;
      // Emit the SuccessCountStartEvent with the updated time left
      add(SuccessCountStartEvent(timeLeft: timeLeft));
    });
  }

  // Close the SuccessPageBloc
  @override
  Future<void> close() {
    // Cancel the timer
    _timer.cancel();
    // Close the SuccessPageBloc
    return super.close();
  }
}
