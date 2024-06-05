import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/const/app_padding.dart';

import '../theme/color/app_colors.dart';
import 'app_info_dailog.dart';

class PanelTitleWidget extends StatelessWidget {
  final String title;

  final bool padding;
  const PanelTitleWidget({
    required this.title,
    this.padding = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: padding ? AppPading.authPadding : 0),
      child: Column(
        children: [
          SizedBox(height: padding ? 25 : 20),
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                width: 5.w,
              ),
              IconButton(
                onPressed: () {
                  PanelDailog.show(
                    context,
                  );
                },
                icon: Icon(
                  IconlyLight.info_circle,
                  color: AppDarkColor.instance.gradientPrimary,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: AppDarkColor.instance.softBackground,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class PanelDailog {
  PanelDailog._();

  static show(BuildContext context) {
    AppInfoDialog.show(
        context: context,
        widget: SizedBox(
          width: double.infinity,
          child: Column(children: [
            Text(
              "Client Contracts",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10.h),
            Text("In this section you can see the contracts hired by you.",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppDarkColor.instance.primaryTextSoft,
                    )),
            SizedBox(height: 10.h),
            Text(
                "You can see the details of the contract and the status of the contract."),
            SizedBox(height: 10.h),
          ]),
        ));
  }
}
