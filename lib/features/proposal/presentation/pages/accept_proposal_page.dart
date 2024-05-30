import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/route/route_name/app_route_name.dart';
import 'package:take_my_tym/features/wallet/presentation/bloc/wallet_bloc/wallet_bloc.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/model/app_post_model.dart';
import '../../../../core/model/app_user_model.dart';
import '../../../../core/route/page_transition/app_page_transition.dart';
import '../../../../core/widgets/common_app_bar.dart';
import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/loading_dialog.dart';
import '../../../profile/presentation/bloc/get_profile_bloc/get_profile_bloc.dart';
import '../../../profile/presentation/widget/post_owner_info_widget/get_user_info_widget.dart';
import '../../../../core/widgets/post_card.dart';
import '../../../wallet/presentation/model/payment_page_arguments.dart';
import '../../../wallet/presentation/util/wallet_action_type.dart';
import '../../../../core/widgets/offer_subtitle_widget.dart';
import '../../data/models/offer_model.dart';
import '../bloc/accept_proposal_bloc/offer_bloc.dart';
import '../bloc/get_offer_bloc/get_proposal_bloc.dart';
import '../widgets/accept_message.dart';
import '../widgets/accept_offer_widget.dart';

class AcceptProposalPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener(
          bloc: acceptProposalBloc,
          listener: (context, state) {
            if (state is OfferLoading) {
              LoadingDialog.show(context);
            }
            if (state is OfferSuccess) {
              context.read<GetProposalBloc>().add(ProposalGetEvent(
                  uid: context.read<AppUserBloc>().userModel!.uid));
              Navigator.pop(context);
            }
          },
        ),
        BlocListener<WalletBloc, WalletState>(
          listener: (context, state) {
            if (state is WalletTransferSuccessState) {
              acceptProposalBloc.add(
                OfferAcceptEvent(
                  paymentId: state.transactionId,
                  offerModel: offerModel,
                  userId: context.read<AppUserBloc>().userModel!.uid,
                  postModel: postModel,
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
                  dateDescription: "Proposed on",
                  getProfileBloc: GetProfileBloc(),
                  timestamp: offerModel.proposelDate,
                  userId: offerModel.applicantUid,
                ),
                SizedBox(height: 25.h),
                AcceptMessage(msg: offerModel.message),
                SizedBox(height: 25.h),
                PostCard(
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
            acceptProposalBloc.add(
              OfferRejectEvent(
                offerModel: offerModel,
                userId: context.read<AppUserBloc>().userModel!.uid,
              ),
            );
          },
          accept: () {
            Navigator.pushNamed(context, RouteName.payment,
                arguments: PaymentPageArguments(
                    amount: postModel.price,
                    type: WalletAction.transfer,
                    walletModel: null));
          },
        ),
      ),
    );
  }
}
