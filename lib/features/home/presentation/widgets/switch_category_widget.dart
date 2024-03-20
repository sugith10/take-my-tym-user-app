import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

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
        return ToggleStyle(
backgroundColor: Colors.transparent,
        );
      },
      current: positive,
      first: false,
      second: true,
      spacing: 50.0,
      style: const ToggleStyle(
        borderColor: Colors.transparent,
        // boxShadow:  [
        //   BoxShadow(
        //     color: Colors.black26,
        //     spreadRadius: 1,
        //     blurRadius: 2,
        //     offset: Offset(0, 1.5),
        //   ),
        // ],
      ),
      borderWidth: 7.5,
      height: 45,
      onChanged: (b) => setState(() => positive = b),
      styleBuilder: (b) => ToggleStyle(
        indicatorColor: b ? const Color(0xFFA95EFA) : const Color(0xFFA95EFA),
      ),
      iconBuilder: (value) => value
          ? const Icon(Icons.coronavirus_rounded)
          : const Icon(Icons.tag_faces_rounded),
      textBuilder: (value) => value
          ? Center(
              child: Text(
                'Sell Tym',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: MyAppDarkColor().background,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : const Center(child: Text('Buy Tym')),
      indicatorSize: const Size.fromWidth(30.0),

    );
  }
}
