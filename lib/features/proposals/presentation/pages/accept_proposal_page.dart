import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/model/app_post_model.dart';
import '../../../../core/model/app_user_model.dart';
import '../../../../core/navigation/screen_transitions/left_to_right.dart';
import '../../../../core/widgets/common_app_bar.dart';
import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/loading_dialog.dart';
import '../../../../core/widgets/post_owner_info_widget.dart';
import '../../../../core/widgets/posted_content.dart';
import '../../../work/presentation/widgets/offer_subtitle_widget.dart';
import '../../data/models/offer_model.dart';
import '../bloc/offer_bloc/offer_bloc.dart';
import '../bloc/proposal_bloc/proposal_bloc.dart';
import '../widgets/accept_message.dart';
import '../widgets/accept_offer_widget.dart';

class AcceptProposalPage extends StatelessWidget {
  final UserModel userModel;
  final PostModel postModel;
  final OfferModel offerModel;
  final OfferBloc offerBloc;

  const AcceptProposalPage({
    required this.offerBloc,
    required this.postModel,
    required this.userModel,
    required this.offerModel,
    super.key,
  });

  static route({
    required PostModel postModel,
    required UserModel userModel,
    required OfferBloc offerBloc,
    required OfferModel offerModel,
  }) =>
      leftToRight(
        AcceptProposalPage(
          postModel: postModel,
          userModel: userModel,
          offerBloc: offerBloc,
          offerModel: offerModel,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: offerBloc,
      listener: (context, state) {
        log(state.toString());
        if (state is OfferLoading) {
          LoadingDialog().show(context);
        }
        if (state is OfferSuccess) {
          context.read<ProposalBloc>().add(ProposalGetEvent(
              uid: context.read<AppUserBloc>().userModel!.uid));
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: const SimpleAppBar(),
        body: HomePadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                const OfferSubtitleWidget(title: "Proposed by"),
                SizedBox(height: 15.h),
                PostOwnerInfoWidget(
                  date: offerModel.proposelDate,
                  image: '',
                  name: postModel.userName,
                ),
                SizedBox(height: 25.h),
                AcceptMessage(
                  name: postModel.userName,
                  msg: offerModel.message,
                ),
                SizedBox(height: 25.h),
                PostedContentWidget(
                  voidCallback: () {},
                  postModel: postModel,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AcceptOfferWidget(
          reject: () {
            offerBloc.add(
              OfferRejectEvent(
                offerModel: offerModel,
                userId: context.read<AppUserBloc>().userModel!.uid,
              ),
            );
          },
        ),
      ),
    );
  }
}
