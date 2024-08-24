import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/user_bloc/user_bloc.dart';
import '../../../../core/const/app_padding.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppPading.homePadding),
      child: Text(
        'Hi, ${context.read<UserBloc>().userModel!.userName}',
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
