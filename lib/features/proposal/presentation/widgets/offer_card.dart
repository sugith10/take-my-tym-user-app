import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/shimmer_common_widget.dart';
import '../../data/models/offer_model.dart';
import '../bloc/accept_proposal_bloc/offer_bloc.dart';
import '../pages/accept_proposal_page.dart';
import '../../../../core/widgets/offer_list_tile.dart';

class OfferCard extends StatelessWidget {
  final AcceptProposalBloc acceptProposalBloc;
  final OfferModel offerModel;
  const OfferCard({
    required this.acceptProposalBloc,
    required this.offerModel,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: acceptProposalBloc
        ..add(
          OfferDetailsEvent(offerModel: offerModel),
        ),
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
                  acceptProposalBloc: acceptProposalBloc,
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
