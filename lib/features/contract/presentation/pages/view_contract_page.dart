import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/utils/theme/app_colors.dart';
import 'package:take_my_tym/core/widgets/app_dialog.dart';
import 'package:take_my_tym/core/widgets/app_snack_bar.dart';
import 'package:take_my_tym/core/widgets/loading_dialog.dart';
import 'package:take_my_tym/features/contract/presentation/bloc/contract_service_bloc/contract_service_bloc.dart';

import '../../../../core/navigation/screen_transitions/left_to_right.dart';
import '../../../../core/widgets/auth_padding.dart';
import '../../../../core/widgets/common_app_bar.dart';
import '../../../../core/widgets/offer_subtitle_widget.dart';
import '../../../../core/widgets/submit_button.dart';
import '../../data/models/contract_model.dart';
import '../bloc/contracts_bloc/contracts_bloc.dart';
import '../widgets/contract_details_widget.dart';
import '../widgets/contract_time_line.dart';
import '../widgets/coustomer_service_fab.dart';
import 'coustomer_service_page.dart';

class ViewContractPage extends StatelessWidget {
  final ContractModel contractModel;
  ViewContractPage({required this.contractModel, super.key});
  static route({required ContractModel contractModel}) =>
      leftToRight(ViewContractPage(
        contractModel: contractModel,
      ));
  final _bloc = ContractServiceBloc();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (context, state) {
        if (state is ContractServiceLoading) {
          LoadingDialog().show(context);
        }
        if (state is ContractServiceFinish) {
          context.read<ContractsBloc>().add(
                GetActiveContractsEvent(
                    userId: context.read<AppUserBloc>().userModel!.uid),
              );
          Navigator.pop(context);
          Navigator.pop(context);
          AppSnackBar().successSnackBar(
            context: context,
            title: "Successfully Completed",
            message: "Lorem Ipsum is simply dummy text of the printing",
          );
        }
      },
      child: Scaffold(
        appBar: const SimpleAppBar(),
        body: SingleChildScrollView(
          child: AuthPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContractDetailsWidget(contractModel: contractModel),
                SizedBox(height: 30.h),
                const OfferSubtitleWidget(title: 'Contract Overview'),
                SizedBox(height: 10.h),
                ContractTimeLine(contractModel: contractModel),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
        floatingActionButton: CoustomerServiceFab(
          callback: () => Navigator.push(context, CoustomerServicePage.route()),
        ),
        bottomNavigationBar: ProjectCompleteButton(
          contractModel: contractModel,
          callback: () {
            _bloc.add(
              FinishContractServiceEvent(contractModel: contractModel),
            );
          },
        ),
      ),
    );
  }
}

class ProjectCompleteButton extends StatelessWidget {
  final ContractModel contractModel;
  final VoidCallback callback;
  const ProjectCompleteButton({
    required this.callback,
    required this.contractModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (context.read<AppUserBloc>().userModel!.uid == contractModel.clientId &&
        contractModel.contractEnded != true) {
      return SubmitButton(
        text: "Project Completed",
        callback: () {
          AppDialog.show(
            context: context,
            title: "Project Completed",
            subtitle:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            action: "Completed",
            actionColor: AppDarkColor.instance.success,
            actionCall: () {
              Navigator.pop(context);
              callback();
            },
          );
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
