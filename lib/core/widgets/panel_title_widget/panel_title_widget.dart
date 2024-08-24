import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/const/app_padding.dart';
import 'package:take_my_tym/core/widgets/app_bottom_sheet.dart';

import '../../theme/color/app_colors.dart';
import 'model/panel_tile_model.dart';

part 'widget/panel_dailog.dart';

class PanelTileWidget extends StatelessWidget {
  final PanelTileModel panelTileModel;
  const PanelTileWidget({
    required this.panelTileModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: panelTileModel.padding ? AppPading.authPadding : 0),
      child: Column(
        children: [
          SizedBox(height: panelTileModel.padding ? 25 : 20),
          Row(
            children: [
              Text(
                panelTileModel.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                width: 5.w,
              ),
              IconButton(
                onPressed: () {
                  PanelSheet.show(
                    context: context,
                    title: panelTileModel.expandedTitle ?? panelTileModel.title,
                    description: panelTileModel.description,
                    details:panelTileModel.details,
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
