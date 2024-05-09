import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/panel_title_widget.dart';
import '../../../../core/widgets/shimmer_common_widget.dart';
import '../bloc/offer_bloc/offer_bloc.dart';
import '../bloc/proposal_bloc/proposal_bloc.dart';
import '../bloc/submit_bloc/submit_bloc.dart';
import '../widgets/offer_proposal_widget.dart';
import '../widgets/submit_proposal_widget.dart';

class ProposalsStatusTab extends StatelessWidget {
  const ProposalsStatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
      ),
    );
  }
}
