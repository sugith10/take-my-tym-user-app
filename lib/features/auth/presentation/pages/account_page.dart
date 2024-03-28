import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/account_info_content_widget.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/log_out_widget.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({super.key});

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
           LogOutWidget(
            callback: (){
       
            },
           )
          ],
        ),
      ),
    );
  }
}


