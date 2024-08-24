import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/get_profile_bloc/get_profile_bloc.dart';
import 'post_owner_info_widget.dart';

class GetUserInfoWidget extends StatelessWidget {
  final String userId;
  final String dateDescription;
  final Timestamp? timestamp;
  final GetProfileBloc getProfileBloc;
  const GetUserInfoWidget({
    required this.getProfileBloc,
     this.timestamp,
    required this.dateDescription,
    super.key, required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getProfileBloc
        ..add(
          GetProfileEvent(userId: userId),
        ),
      builder: (context, state) {
        if (state is GetProfileLoaded) {
          return UserInfoWidget(
            description: "Proposed on",
            date: timestamp,
            name: state.userModel.userName,
          );
        }

        return UserInfoWidget(
          description: "Proposed on",
          date: timestamp,
          name: "...",
        );
      },
    );
  }
}
