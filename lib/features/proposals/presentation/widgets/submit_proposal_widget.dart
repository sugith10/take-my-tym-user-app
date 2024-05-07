import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/app_bottom_sheet.dart';
import 'package:take_my_tym/core/widgets/contract_timeline_widget.dart';
import 'package:take_my_tym/core/widgets/shimmer_common_widget.dart';
import 'package:take_my_tym/features/proposals/presentation/bloc/submit_bloc/submit_bloc.dart';
import 'package:take_my_tym/features/proposals/presentation/widgets/offer_list_tile.dart';

class SubmitProposalWidget extends StatelessWidget {
  final SubmitBloc submitBloc;

  const SubmitProposalWidget({
    required this.submitBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: submitBloc,
      builder: (context, state) {
        if (state is SubmitLoaded) {
          return OfferListTile(
            text: state.postModel.title,
            onPressed: () {
              _proposeProgressSheet(
                context,
                state.submitModel.status,
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

  void _proposeProgressSheet(BuildContext context, bool status) {
    String text = status ? "Proposal Rejected" : "Waiting for confirmation";

    AppBottomSheet.show(
      context: context,
      children: [
        SizedBox(height: 7.5.h),
        Text(
          'Proposal status',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 2.h),
        const TimeLineTileWidget(
          isFirst: true,
          isLast: false,
          isPast: true,
          text: 'Succefully submited',
        ),
        TimeLineTileWidget(
          isFirst: false,
          isLast: true,
          isPast: status,
          text: text,
          color: status
              ? AppDarkColor.instance.danger
              : AppDarkColor.instance.danger,
          icon: status ? Icons.close_rounded : Icons.close_rounded,
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
