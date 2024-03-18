import 'package:flutter/material.dart';

class DrawerCustomButton extends StatelessWidget {
  final String title;
  final Function function;
  final  icon;
  const DrawerCustomButton({
    required this.icon,
    required this.title,
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        function();
      },
      child: ListTile(
        leading: Icon(
          icon,
          size: 25,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
