import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/app_info_dailog.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: MyAppPadding.homePadding),
      child: GestureDetector(
        onTap: () {
          AppInfoDialog().showAppIntroDialog(context: context);
        },
        child: Text(
          'Hi, ${context.read<AppUserBloc>().appUserModel!.userName}',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}