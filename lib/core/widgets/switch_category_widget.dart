
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_responsive.dart';

class SwitchCategoryWidget extends StatefulWidget {
  final Function(bool) getTymType;
  final bool tymType;
  const SwitchCategoryWidget({
    this.tymType = true,
    required this.getTymType,
    super.key,
  });

  @override
  State<SwitchCategoryWidget> createState() => _SwitchCategoryWidgetState();
}

class _SwitchCategoryWidgetState extends State<SwitchCategoryWidget> {
  bool current = true;

  @override
  void initState() {
    super.initState();
    current = widget.tymType;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      customStyleBuilder: (context, local, global) {
        return ToggleStyle(
          borderColor: Colors.transparent,
          backgroundGradient: LinearGradient(
            colors: [
              MyAppDarkColor.instance.gradientPrimary,
              MyAppDarkColor.instance.gradientSecondary,
            ],
          ),
          indicatorColor: const Color.fromRGBO(255, 255, 255, 1),
        );
      },
      current: current,
      first: true,
      second: false,
      spacing: 60.0,
      style: ToggleStyle(
        borderColor: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: MyAppDarkColor.instance.boxShadow,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1.5),
          ),
        ],
      ),
      borderWidth: 7.5,
      height: 45,
      onChanged: (value) {
        setState(() => current = value);
        widget.getTymType(value);
      },
      textBuilder: (value) => value
          ? const Center(
              child: _Text(
                tymType: 'Buy Tym',
              ),
            )
          : const Center(
              child: _Text(
                tymType: 'Sell Tym',
              ),
            ),
      indicatorSize: const Size.fromWidth(30.0),
    );
  }
}

class _Text extends StatelessWidget {
  final String tymType;
  const _Text({
    required this.tymType,
  });

  @override
  Widget build(BuildContext context) {
    if (MobileResponsive.mobileMedium(context)) {
      return Text(
        tymType,
        style: Theme.of(context).textTheme.labelSmall,
      );
    }
    return Text(
      tymType,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
