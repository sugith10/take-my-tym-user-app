import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';

class ProfileWidget extends StatelessWidget {
  final String name;
  final String email;
  final String picture;
  const ProfileWidget({
    required this.name,
    required this.email,
    required this.picture,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: SizedBox(
        child: Row(
          children: [
            CircleProfilePicWidget(
              height: 80,
              width: 80,
              image: picture,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    email,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
