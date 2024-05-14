import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'success_page_event.dart';
part 'success_page_state.dart';

const int _initialTimeLeft = 5;

class SuccessPageBloc extends Bloc<SuccessPageEvent, SuccessPageState> {
  late Timer _timer;

  SuccessPageBloc()
      : super(const SuccessPageTimeLeftState(timeLeft: _initialTimeLeft)) {
    _startTimer(initialTimeLeft: _initialTimeLeft);
    on<SuccessPageEvent>(
      (event, emit) async {
        if (event.timeLeft <= 0) {
          _timer.cancel();
          return emit(SuccessPageExistState());
        } else {
          emit(SuccessPageTimeLeftState(timeLeft: event.timeLeft));
        }
      },
    );
  }

  void _startTimer({required int initialTimeLeft}) {
    int timeLeft = initialTimeLeft;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timeLeft--;
      log("remaining time $timeLeft");
      add(SuccessPageEvent(timeLeft: timeLeft));
    });
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
