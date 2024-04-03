import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_post_event.dart';
part 'user_post_state.dart';

class UserPostBloc extends Bloc<UserPostEvent, UserPostState> {
  UserPostBloc() : super(UserPostInitial()) {
    on<GetBuyTymPostsEvent>((event, emit) {
      log('its BuyTym posts');
    });

    on<GetSellTymPostsEvent>(((event, emit) {
      log("its sell tym posts");
    }));
  }
}
