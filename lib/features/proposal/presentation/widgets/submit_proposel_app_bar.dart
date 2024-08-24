import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/widgets/action_button.dart';
import '../bloc/proposal_submit_bloc/submit_proposal_bloc.dart';

class SubmitPageAppBar extends StatelessWidget {
  final SubmitProposalBloc submitProposalBloc;
  final VoidCallback callback;
  const SubmitPageAppBar({
    super.key,
    required this.submitProposalBloc,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(IconlyLight.arrow_down_2),
      ),
      actions: [
        BlocBuilder(
          bloc: submitProposalBloc,
          builder: (context, state) {
            if (state is SubmitProposalPageState) {
              if (state.pageNumber == 0) {
                return ActionButton(
              action: 'Next',
              callback: () {
                callback();
              },
            );
             
              }
            }
               return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
