import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/user_log_out_dialog.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/core/widgets/show_loading_dialog.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/sign_out_bloc/sign_out_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/pages/welcome_page.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/account_info_content_widget.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/log_out_widget.dart';

class AccountInfoPage extends StatefulWidget {
  const AccountInfoPage({super.key});

  @override
  State<AccountInfoPage> createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  final SignOutBloc _bloc = SignOutBloc();
  @override
  Widget build(BuildContext context) {
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
            const AccountInfoContentWidget(
              title: "Username",
              subtitle: "Sugit K",
            ),
            const AccountInfoContentWidget(
              title: "Email address",
              subtitle: "sugithkodappurath@gmail.com",
            ),
            const AccountInfoContentWidget(
              title: "Phone",
              subtitle: "7907603014",
            ),
            const AccountInfoContentWidget(
              title: "Location",
              subtitle: "Calicut Kerala, India",
            ),
            BlocListener(
              bloc: _bloc,
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const WelcomePage()),
                      (route) => false);
                }
              },
              child: LogOutWidget(
                callback: () {
                  UserLogOut().showLogOutDialog(
                      context: context,
                      signOutBloc: _bloc,
                      cancelCallback: () {
                        Navigator.pop(context);
                      },
                      logOutCallback: () {
                        _bloc.add(UserSignOutEvent());
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
