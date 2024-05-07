import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/app_bottom_sheet.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/core/widgets/shimmer_common_widget.dart';
import 'package:take_my_tym/features/proposals/presentation/bloc/offer_bloc/offer_bloc.dart';
import 'package:take_my_tym/features/proposals/presentation/bloc/proposal_bloc/proposal_bloc.dart';
import 'package:take_my_tym/features/proposals/presentation/bloc/submit_bloc/submit_bloc.dart';
import 'package:take_my_tym/features/proposals/presentation/pages/accept_proposal_page.dart';
import 'package:take_my_tym/core/widgets/contract_timeline_widget.dart';
import 'package:take_my_tym/features/proposals/presentation/widgets/offer_list_tile.dart';
import 'package:take_my_tym/core/widgets/panel_title_widget.dart';
import 'package:take_my_tym/features/proposals/presentation/widgets/submit_proposal_widget.dart';

class ProposalsStatusTab extends StatelessWidget {
  const ProposalsStatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PanelTitleWidget(
          title: 'Offers',
        ),
        BlocBuilder<ProposalBloc, ProposalState>(
          builder: (context, state) {
            if (state is ProposalSucessSate) {
              if (state.proposalModel.offerList.isEmpty) {
                return const Center(
                  child: Text("No items to display"),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.proposalModel.offerList.length,
                  itemBuilder: (context, index) {
                    final offerModel = state.proposalModel.offerList[index];
                    return OfferProposalWidget(
                      offerBloc: OfferBloc()
                        ..add(
                          OfferDetailsEvent(offerModel: offerModel),
                        ),
                    );
                  },
                );
              }
            }
            if (state is ProposalLoadingState) {
              return const ShimmerCommonWidget();
            }
            return const SizedBox.shrink();
          },
        ),
        SizedBox(height: 20.h),
        const PanelTitleWidget(
          title: 'Submitted proposals',
        ),
        BlocBuilder<ProposalBloc, ProposalState>(
          builder: (context, state) {
            if (state is ProposalSucessSate) {
              if (state.proposalModel.submitList.isEmpty) {
                return const Center(
                  child: Text("No items to display"),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.proposalModel.submitList.length,
                  itemBuilder: (context, index) {
                    final submitModel = state.proposalModel.submitList[index];
                    return SubmitProposalWidget(
                      submitBloc: SubmitBloc()
                        ..add(SubmitDetailsEvent(submitModel: submitModel)),
                    );
                  },
                );
              }
            }
            if (state is ProposalLoadingState) {
              return const ShimmerCommonWidget();
            }
            return SizedBox.fromSize();
          },
        ),
      ],
    );
  }
}

class OfferProposalWidget extends StatelessWidget {
  final OfferBloc offerBloc;
  const OfferProposalWidget({
    required this.offerBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: offerBloc,
      builder: (context, state) {
        if (state is OfferLoaded) {
          return OfferListTile(
            text: state.postModel.title,
            onPressed: () {
              Navigator.push(
                context,
                AcceptProposalPage.route(
                  postModel: state.postModel,
                  userModel: state.userModel,
                  offerBloc: offerBloc,
                  offerModel: state.offerModel,
                ),
              );
            },
          );
        }

        return const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: ShimmerCommonWidget(),
        );
      },
    );
  }
}
