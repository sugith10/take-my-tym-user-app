import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../proposals/data/models/offer_model.dart';
import '../../bloc/get_profile_bloc/get_profile_bloc.dart';
import 'post_owner_info_widget.dart';

class GetUserInfoWidget extends StatelessWidget {
  final OfferModel offerModel;

  final GetProfileBloc getProfileBloc;
  const GetUserInfoWidget({
    required this.getProfileBloc,
    required this.offerModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getProfileBloc
        ..add(
          GetProfileEvent(userId: offerModel.applicantUid),
        ),
      builder: (context, state) {
        if (state is GetProfileLoaded) {
          return UserInfoWidget(
            description: "Proposed on",
            date: offerModel.proposelDate,
            image: '',
            name: state.userModel.userName,
          );
        }

        return UserInfoWidget(
          description: "Proposed on",
          date: offerModel.proposelDate,
          image: '',
          name: "...",
        );
      },
    );
  }
}
