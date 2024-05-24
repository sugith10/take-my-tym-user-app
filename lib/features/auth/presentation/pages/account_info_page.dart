import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/model/app_user_model.dart';
import '../../../../core/widgets/app_bar/close_app_bar.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/auth_padding.dart';
import '../../../../core/widgets/loading_dialog.dart';
import '../bloc/sign_out_bloc/sign_out_bloc.dart';
import '../widgets/account_info_content_widget.dart';
import '../widgets/sign_out/account_info_log_out_widget.dart';
import 'welcome_page.dart';


class AccountInfoPage extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AccountInfoPage());
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = context.read<AppUserBloc>().userModel!;
    return Scaffold(
      appBar: const CloseAppBar(),
      body: AuthPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            Text("Account Info",
                style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 20.h),
            AccountInfoContentWidget(
              title: "Username",
              subtitle: userModel.userName,
            ),
            AccountInfoContentWidget(
              title: "Email address",
              subtitle: userModel.email,
            ),
            const AccountInfoContentWidget(
              title: "Phone",
              subtitle: "7907603014",
            ),
            AccountInfoContentWidget(
              title: "Location",
              subtitle: userModel.location!,
            ),
            BlocListener<SignOutBloc, SignOutState>(
              listener: (context, state) {
                if (state is SignOutFailState) {
                  AppSnackBar.failSnackBar(
                    context: context,
                    error: state.error,
                  );
                }
                if (state is SignOutLoadingState) {
                  LoadingDialog().show(context);
                }
                if (state is SignOutSuccessState) {
                  context.read<AppUserBloc>().add(UpdateUserSignOutEvent());
             
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const WelcomePage()),
                      (route) => false);
                }
              },
              child: AccountInfoLogOutWidget(
                callback: () {
               
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
