import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/widgets/app_card.dart';

class AcceptMessage extends StatefulWidget {
  final String msg;
  const AcceptMessage({
    required this.msg,
    super.key,
  });

  @override
  State<AcceptMessage> createState() => _AcceptMessageState();
}

class _AcceptMessageState extends State<AcceptMessage> {
  bool _icon = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      enabled: true,
      initiallyExpanded: true,
      enableFeedback: false,
      title: const Text('Message :'),
      trailing: _icon
          ? const Icon(IconlyLight.arrow_up_circle)
          : const Icon(IconlyLight.arrow_down_circle),
      onExpansionChanged: (value) => setState(() {
        _icon = value;
      }),
      children: [
        AppCard(
          voidCallback: () {},
          width: double.infinity,
          child: Text(widget.msg),
        )
      ],
    );
  }
}
