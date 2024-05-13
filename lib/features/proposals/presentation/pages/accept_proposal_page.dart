import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/features/wallet/presentation/bloc/wallet_bloc/wallet_bloc.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/model/app_post_model.dart';
import '../../../../core/model/app_user_model.dart';
import '../../../../core/navigation/screen_transitions/left_to_right.dart';
import '../../../../core/widgets/common_app_bar.dart';
import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/loading_dialog.dart';
import '../../../profile/presentation/bloc/get_profile_bloc/get_profile_bloc.dart';
import '../../../profile/presentation/widgets/post_owner_info_widget/get_user_info_widget.dart';
import '../../../../core/widgets/posted_content.dart';
import '../../../wallet/presentation/pages/payment_page.dart';
import '../../../wallet/presentation/util/wallet_action_type.dart';
import '../../../work/presentation/widgets/offer_subtitle_widget.dart';
import '../../data/models/offer_model.dart';
import '../bloc/accept_proposal_bloc/offer_bloc.dart';
import '../bloc/get_offer_bloc/proposal_bloc.dart';
import '../widgets/accept_message.dart';
import '../widgets/accept_offer_widget.dart';

class AcceptProposalPage extends StatefulWidget {
  final UserModel userModel;
  final PostModel postModel;
  final OfferModel offerModel;
  final AcceptProposalBloc acceptProposalBloc;

  const AcceptProposalPage({
    required this.acceptProposalBloc,
    required this.postModel,
    required this.userModel,
    required this.offerModel,
    super.key,
  });

  static route({
    required PostModel postModel,
    required UserModel userModel,
    required AcceptProposalBloc acceptProposalBloc,
    required OfferModel offerModel,
  }) =>
      leftToRight(
        AcceptProposalPage(
          postModel: postModel,
          userModel: userModel,
          acceptProposalBloc: acceptProposalBloc,
          offerModel: offerModel,
        ),
      );

  @override
  State<AcceptProposalPage> createState() => _AcceptProposalPageState();
}

class _AcceptProposalPageState extends State<AcceptProposalPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener(
          bloc: widget.acceptProposalBloc,
          listener: (context, state) {
            if (state is OfferLoading) {
              LoadingDialog().show(context);
            }
            if (state is OfferSuccess) {
              context.read<ProposalBloc>().add(ProposalGetEvent(
                  uid: context.read<AppUserBloc>().userModel!.uid));
              Navigator.pop(context);
            }
          },
        ),
        BlocListener<WalletBloc, WalletState>(
          listener: (context, state) {
            if (state is WalletTransferSuccessState) {
              widget.acceptProposalBloc.add(
                OfferAcceptEvent(
                    offerModel: widget.offerModel,
                    userId: context.read<AppUserBloc>().userModel!.uid,
                    amount: widget.postModel.price,
                    ),
              );
            }
          },
        )
      ],
      child: Scaffold(
        appBar: const SimpleAppBar(),
        body: HomePadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                const OfferSubtitleWidget(title: "Proposed by"),
                SizedBox(height: 10.h),
                GetUserInfoWidget(
                  offerModel: widget.offerModel,
                  getProfileBloc: GetProfileBloc(),
                ),
                SizedBox(height: 25.h),
                AcceptMessage(msg: widget.offerModel.message),
                SizedBox(height: 25.h),
                PostedContentWidget(
                  voidCallback: () {},
                  postModel: widget.postModel,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AcceptOfferWidget(
          reject: () {
            widget.acceptProposalBloc.add(
              OfferRejectEvent(
                offerModel: widget.offerModel,
                userId: context.read<AppUserBloc>().userModel!.uid,
              ),
            );
          },
          accept: () {
            Navigator.push(
                context,
                PaymentPage.route(
                    type: WalletAction.transfer,
                    amount: widget.postModel.price));
          },
        ),
      ),
    );
  }
}
