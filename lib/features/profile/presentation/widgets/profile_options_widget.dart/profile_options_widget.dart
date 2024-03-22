import 'package:flutter/material.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/profile_options_widget.dart/widgets/profile_option_button.dart';

class ProfileOptionsWidget extends StatelessWidget {
  const ProfileOptionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ProfileOptionButton(
          action: 'Edit Profile',
        ),
        Spacer(),
        ProfileOptionButton(
          action: 'Share Profile',
        ),
        Spacer(),
        ProfileOptionButton(
          action: 'Contact',
        )
      ],
    );
  }
}