import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/const/app_icons.dart';
import '../../../../core/widgets/action_button.dart';

class CreatePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback actionCall;
  final bool next; 
  const CreatePageAppBar({
    required this.actionCall,
    required this.next,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon:  Icon(next ? IconlyLight.arrow_down_2 : AppIcon.back),
      ),
      actions: [
        ActionButton(
          callback: () {
            actionCall();
          },
          action: next ? "Next" : 'Submit',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
