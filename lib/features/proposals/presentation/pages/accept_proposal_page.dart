import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/navigation/screen_transitions/left_to_right.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/app_card.dart';
import 'package:take_my_tym/core/widgets/app_dialog.dart';
import 'package:take_my_tym/core/widgets/common_app_bar.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/loading_dialog.dart';
import 'package:take_my_tym/core/widgets/post_owner_info_widget.dart';
import 'package:take_my_tym/core/widgets/posted_content.dart';
import 'package:take_my_tym/core/widgets/submit_button.dart';
import 'package:take_my_tym/features/proposals/data/models/offer_model.dart';
import 'package:take_my_tym/features/proposals/presentation/bloc/offer_bloc/offer_bloc.dart';
import 'package:take_my_tym/features/proposals/presentation/bloc/proposal_bloc/proposal_bloc.dart';
import 'package:take_my_tym/features/wallet/presentation/pages/payment_page.dart';
import 'package:take_my_tym/features/wallet/presentation/util/wallet_action_type.dart';
import 'package:take_my_tym/features/work/presentation/widgets/offer_subtitle_widget.dart';

class AcceptProposalPage extends StatelessWidget {
  final UserModel userModel;
  final PostModel postModel;
  final OfferBloc offerBloc;
  final OfferModel offerModel;
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
                    date: Timestamp(10, 10),
                    image: '',
                    name: postModel.userName),
                SizedBox(height: 25.h),
                const AcceptMessage(),
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

class AcceptOfferWidget extends StatelessWidget {
  final VoidCallback reject;
  const AcceptOfferWidget({
    required this.reject,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: MyAppPadding.homePadding),
        Expanded(
          child: SubmitButton(
            text: "Reject",
            backgroundColor: AppDarkColor.instance.danger,
            foregroundColor: AppDarkColor.instance.primaryText,
            callback: () {
              AppDialog.show(
                context: context,
                title: "Reject Offer",
                subtitle: "Lorem Ipsum is simply dummy text",
                action: "Reject",
                actionCall: () {
                  Navigator.pop(context);
                  reject();
                  log("reject");
                },
              );
            },
          ),
        ),
        Expanded(
          child: SubmitButton(
            text: "Accept",
            backgroundColor: AppDarkColor.instance.success,
            foregroundColor: AppDarkColor.instance.primaryText,
            callback: () {
              AppDialog.show(
                context: context,
                title: "Accept Offer",
                subtitle: "Lorem Ipsum is simply dummy text",
                action: "Accept",
                actionCall: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, PaymentPage.route(type: WalletAction.transfer));
                },
                actionColor: AppDarkColor.instance.success,
              );
            },
          ),
        ),
        const SizedBox(width: MyAppPadding.homePadding),
      ],
    );
  }
}

class AcceptMessage extends StatefulWidget {
  const AcceptMessage({
    super.key,
  });

  @override
  State<AcceptMessage> createState() => _AcceptMessageState();
}

class _AcceptMessageState extends State<AcceptMessage> {
  bool _icon = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      enabled: true,
      initiallyExpanded: true,
      enableFeedback: false,
      title: const Text('Message from Javad'),
      trailing: _icon
          ? const Icon(IconlyLight.arrow_up_circle)
          : const Icon(IconlyLight.arrow_down_circle),
      onExpansionChanged: (value) => setState(() {
        _icon = value;
      }),
      children: [
        AppCard(
          voidCallback: () {},
          width: double.infinity,
          child: const Text(
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages"),
        )
      ],
    );
  }
}
