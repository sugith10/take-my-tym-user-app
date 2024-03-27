import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomeState()) {
    on<HomePageNavigation>((event, emit) => emit(HomeState()));
    on<MessagePageNavigation>((event, emit) => emit(MessageState()));
    on<MoneyPageNavigation>((event, emit) => emit(MoneyState()));
    on<ProfilePageNavigation>((event, emit) => emit(ProfileState()));
  }
}
