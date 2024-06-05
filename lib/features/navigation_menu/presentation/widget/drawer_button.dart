import 'package:flutter/material.dart';

class DrawerCustomButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final IconData  icon;
  const DrawerCustomButton({
    required this.icon,
    required this.title,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        callback();
      },
      child: ListTile(
        leading: Icon(
          icon,
          size: 25,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
