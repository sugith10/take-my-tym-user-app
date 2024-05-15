import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc/app_user_bloc.dart';
import 'package:take_my_tym/features/contract/presentation/bloc/contracts_bloc/contracts_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/close_icon_button.dart';

class ContractTabButtons extends StatefulWidget {
  const ContractTabButtons({super.key});

  @override
  State<ContractTabButtons> createState() => _ContractTabButtonsState();
}

class _ContractTabButtonsState extends State<ContractTabButtons> {
  late bool activeTab;
  late String userId;

  @override
  void initState() {
    activeTab = context.read<ContractsBloc>().type;
    userId = context.read<AppUserBloc>().userModel!.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildButton(
          context: context,
          title: "Active",
          isActive: activeTab,
          onTap: () {
            context
                .read<ContractsBloc>()
                .add(GetActiveContractsEvent(userId: userId));
            setState(() {
              activeTab = true;
            });
          },
        ),
        SizedBox(width: 10.w),
        _buildButton(
          context: context,
          title: "Completed",
          isActive: !activeTab,
          onTap: () {
            context
                .read<ContractsBloc>()
                .add(GetCompletedContractsEvent(userId: userId));
            setState(() {
              activeTab = false;
            });
          },
        )
      ],
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String title,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return CloseIconButton(
      onPressed: onTap,
      borderColor: isActive ? null : AppDarkColor.instance.secondaryBorder,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title,
          style: isActive
              ? Theme.of(context).textTheme.labelMedium
              : Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
