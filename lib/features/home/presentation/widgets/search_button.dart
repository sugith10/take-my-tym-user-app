import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchButton extends StatelessWidget {
  final Function function;
  const SearchButton({
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        function();
      },
      icon: const CircleAvatar(
        backgroundColor:
            Color.fromARGB(255, 40, 40, 40),
        child: Icon(IconlyLight.search),
      ),
    );
  }
}
