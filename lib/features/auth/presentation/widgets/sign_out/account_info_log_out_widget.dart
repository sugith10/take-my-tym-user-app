import 'package:flutter/material.dart';

class AccountInfoLogOutWidget extends StatelessWidget {
  final VoidCallback callback;
  const AccountInfoLogOutWidget({
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: const Color.fromARGB(0, 93, 93, 93),
      onTap: () {
        callback();
      },
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Text(
              'Log Out',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: const Color.fromRGBO(244, 67, 54, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
