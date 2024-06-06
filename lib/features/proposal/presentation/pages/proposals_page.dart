import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/empty_list_text.dart';
import '../../../../core/widgets/panel_title_widget/panel_title_widget.dart';
import '../../../../core/widgets/shimmer_common_widget.dart';
import '../bloc/accept_proposal_bloc/offer_bloc.dart';
import '../bloc/get_offer_bloc/get_proposal_bloc.dart';
import '../bloc/get_submit_bloc/submit_bloc.dart';
import '../model/proposal_panel_tile_model.dart';
import '../widgets/offer_card.dart';
import '../widgets/submit_proposal_widget.dart';

class ProposalPage extends StatelessWidget {
  const ProposalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PanelTileWidget(
            panelTileModel: ProposalPanelTileModel.offer,
          ),
          BlocBuilder<GetProposalBloc, ProposalState>(
            builder: (context, state) {
              if (state is ProposalSucessSate) {
                if (state.proposalModel.offerList.isEmpty) {
                  return const EmptyListText(
                    padding: 40,
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.proposalModel.offerList.length,
                    itemBuilder: (context, index) {
                      final offerModel = state.proposalModel.offerList[index];
                      return OfferCard(
                        acceptProposalBloc: AcceptProposalBloc(),
                        offerModel: offerModel,
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
          PanelTileWidget(
            panelTileModel: ProposalPanelTileModel.submitted,
          ),
          BlocBuilder<GetProposalBloc, ProposalState>(
            builder: (context, state) {
              if (state is ProposalSucessSate) {
                if (state.proposalModel.submitList.isEmpty) {
                  return const EmptyListText(
                    padding: 40,
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.proposalModel.submitList.length,
                    itemBuilder: (context, index) {
                      final submitModel = state.proposalModel.submitList[index];
                      return SubmitProposalWidget(
                        getSubmitBloc: GetSubmitBloc()
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
