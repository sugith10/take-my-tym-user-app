import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_posts_event.dart';
part 'profile_posts_state.dart';

class ProfilePostsBloc extends Bloc<ProfilePostsEvent, ProfilePostsState> {
  ProfilePostsBloc() : super(ProfilePostsInitial()) {
    on<ProfilePostsEvent>((event, emit) {
     
    });
  }
}
