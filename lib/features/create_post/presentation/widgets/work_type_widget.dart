import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class WorkTypeWidget extends StatelessWidget {
  const WorkTypeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            
          },
          borderRadius: BorderRadius.circular(MyAppRadius.borderRound),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(MyAppRadius.borderRound),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: MyAppPadding.authPadding,
                right: MyAppPadding.authPadding,
                top: 2,
                bottom: 2,
              ),
              child: Row(
                children: [
                  Text(
                    'Remote',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.keyboard_arrow_down_rounded)
                ],
              ),
            ),
          ),
        ),
       const Expanded(child: SizedBox())
      ],
    );
  }
}
