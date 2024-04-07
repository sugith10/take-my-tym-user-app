import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/bloc/app_bloc.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/user_log_out_dialog.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/core/widgets/show_loading_dialog.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/sign_out_bloc/sign_out_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/pages/welcome_page.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/account_info_content_widget.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_out/account_info_log_out_widget.dart';

class AccountInfoPage extends StatefulWidget {
  const AccountInfoPage({super.key});

  @override
  State<AccountInfoPage> createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  
  @override
  Widget build(BuildContext context) {
    AppUserModel userModel = context.read<AppBloc>().appUserModel!;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
      ),
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
              subtitle: "${userModel.firstName} ${userModel.lastName}",
            ),
            AccountInfoContentWidget(
              title: "Email address",
              subtitle: userModel.email,
            ),
            const AccountInfoContentWidget(
              title: "Phone",
              subtitle: "7907603014",
            ),
            const AccountInfoContentWidget(
              title: "Location",
              subtitle: "Calicut Kerala, India",
            ),
            BlocListener<SignOutBloc,SignOutState>(
         
              listener: (context, state) {
                if (state is UserSignOutFailState) {
                  SnackBarMessenger().showSnackBar(
                    context: context,
                    errorMessage: state.title,
                    errorDescription: state.message,
                  );
                }
                if (state is UserSignOutLoadingState) {
                  ShowLoadingDialog().showLoadingIndicator(context);
                }
                if (state is UserSignOutSuccessState) {
                  context.read<AppBloc>().add(UpdateUserSignOutEvent());
                  log(context.read<AppBloc>().appUserModel.toString());
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const WelcomePage()),
                      (route) => false);
                }
              },
              child: AccountInfoLogOutWidget(
                callback: () {
                  UserLogOut().showLogOutDialog(
                    context: context,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
