import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/bloc/app_bloc.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: MyAppPadding.homePadding),
      child: Text(
        'Hi, ${context.read<AppBloc>().appUserModel!.firstName}...',
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}