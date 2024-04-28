import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'money_event.dart';
part 'money_state.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  MoneyBloc() : super(MoneyInitial()) {
    on<MoneyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
