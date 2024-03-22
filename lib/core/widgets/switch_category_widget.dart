import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class SwitchCategoryWidget extends StatefulWidget {
  const SwitchCategoryWidget({
    super.key,
  });

  @override
  State<SwitchCategoryWidget> createState() => _SwitchCategoryWidgetState();
}

class _SwitchCategoryWidgetState extends State<SwitchCategoryWidget> {
  int value = 0;
  int? nullableValue;
  bool positive = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      customStyleBuilder: (context, local, global) {
        return const ToggleStyle(
          borderColor: Colors.transparent,
          backgroundGradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 78, 78),
              Color.fromRGBO(0, 0, 0, 1),
            ],
          ),
          indicatorColor: Color.fromRGBO(255, 255, 255, 1),
        );
      },
      current: positive,
      first: false,
      second: true,
      spacing: 50.0,
      style: const ToggleStyle(
        borderColor: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(66, 255, 255, 255),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1.5),
          ),
        ],
      ),
      borderWidth: 7.5,
      height: 45,
      onChanged: (b) => setState(() => positive = b),
      textBuilder: (value) => value
          ? Center(
              child: Text(
                'Sell Tym',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            )
          : Center(
              child: Text(
              'Buy Tym',
              style: Theme.of(context).textTheme.labelMedium,
            )),
      indicatorSize: const Size.fromWidth(30.0),
    );
  }
}
