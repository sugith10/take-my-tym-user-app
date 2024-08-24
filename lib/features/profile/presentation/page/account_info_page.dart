import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/user_bloc/user_bloc.dart';
import '../../../../core/model/app_user_model.dart';
import '../../../../core/route/route_name/app_route_name.dart';
import '../../../../core/widgets/action_button.dart';
import '../../../../core/widgets/auth_padding.dart';
import '../../../auth/presentation/widgets/account_info_content_widget.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = context.read<UserBloc>().userModel!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close_rounded),
        ),
        actions: [
          ActionButton(
            action: "Edit",
            callback: () {
                Navigator.pushNamed(context, RouteName.editProfile);
            },
          )
        ],
      ),
      body: AuthPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            Text(
              "Account Info",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                AccountInfoContentWidget(
                  title: "First name",
                  subtitle: userModel.userName,
                ),
                const SizedBox(width: 20),
                AccountInfoContentWidget(
                  title: "Second name",
                  subtitle: userModel.userName,
                ),
              ],
            ),
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
            // LogOutDrawerButton()
          ],
        ),
      ),
    );
  }
}
