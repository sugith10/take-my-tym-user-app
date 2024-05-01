import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/app_title_box_widget.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/submit_button.dart';
import 'package:take_my_tym/features/checkout/presentation/bloc/proposal_bloc/proposal_bloc.dart';

class ProposalMessage extends StatelessWidget {
  final TextEditingController controller;
  final ProposalBloc proposalBloc;
  final FocusNode focusNode;
  const ProposalMessage({
    required this.proposalBloc,
    required this.focusNode,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: HomePadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            AppTitleBoxWidget(
              title: "Why the creator want to hire you" ,
              child: SizedBox(
                height: 100.h,
                child: SingleChildScrollView(
                  child: TextField(
                    focusNode: focusNode,
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "Gave a message to creator",
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                    maxLines: null,
                    style: Theme.of(context).textTheme.labelMedium,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              "Note: Before commit with any contract make sure you reachout contracter and verified the source.",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: SubmitButton(
                    backgroundColor: MyAppDarkColor.instance.success,
                    foregroundColor: MyAppDarkColor.instance.primaryText,
                    callback: () {
                      proposalBloc.add(
                        ProposalSubmitEvent(message: controller.text),
                      );
                      focusNode.unfocus();
                    },
                    text: 'Submit',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
