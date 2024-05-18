import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/name_capitalize.dart';
import '../../../../core/widgets/app_title_box_widget.dart';
import '../../../profile/presentation/bloc/get_profile_bloc/get_profile_bloc.dart';
import '../../../profile/presentation/widget/post_owner_info_widget/get_user_info_widget.dart';
import '../../data/models/contract_model.dart';

class ContractDetailsWidget extends StatelessWidget {
  const ContractDetailsWidget({
    super.key,
    required this.contractModel,
  });

  final ContractModel contractModel;

  @override
  Widget build(BuildContext context) {
    return AppTitleBoxWidget(
      title: 'Contract Details',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          _title(context: context, title: "Contract started"),
          SizedBox(height: 10.h),
          Text(TextManipulator.timestampToDate(contractModel.date)),
          SizedBox(height: 20.h),
          _title(context: context, title: "Client details"),
          GetUserInfoWidget(
            userId: contractModel.clientId,
            getProfileBloc: GetProfileBloc(),
            dateDescription: "",
          ),
          SizedBox(height: 5.h),
          _title(context: context, title: "Service provider details"),
          GetUserInfoWidget(
            userId: contractModel.serviceProviderId,
            getProfileBloc: GetProfileBloc(),
            dateDescription: "",
          ),
          SizedBox(height: 5.h),
        ],
      ),
    );
  }

  Text _title({required BuildContext context, required String title}) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(color: AppDarkColor.instance.primaryTextSoft),
    );
  }
}
