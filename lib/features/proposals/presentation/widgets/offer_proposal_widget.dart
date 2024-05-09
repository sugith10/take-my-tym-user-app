import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/shimmer_common_widget.dart';
import '../bloc/offer_bloc/offer_bloc.dart';
import '../pages/accept_proposal_page.dart';
import 'offer_list_tile.dart';


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
