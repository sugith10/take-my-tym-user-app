import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';

class AppBottomSheet {
  static void show({
    required BuildContext context,
    required List<Widget> children,
    bool header = true,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AuthPadding(
        child: Wrap(
          alignment: WrapAlignment.start,
          children: [
            if (header)
              Padding(
                padding: const EdgeInsets.only(top: 12.5, bottom: 25),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width / 6,
                        decoration: BoxDecoration(
                          color: AppDarkColor.instance.primaryTextSoft,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              const SizedBox.shrink(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            )
          ],
        ),
      ),
    );
  }
}
