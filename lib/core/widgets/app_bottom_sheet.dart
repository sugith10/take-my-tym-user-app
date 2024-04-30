import 'package:flutter/material.dart';
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
            header
                ? const Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 25),
                    child: Divider(
                      thickness: 2.5,
                      color: Colors.white,
                      endIndent: 140,
                      indent: 140,
                    ),
                  )
                : const SizedBox.shrink(),
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
