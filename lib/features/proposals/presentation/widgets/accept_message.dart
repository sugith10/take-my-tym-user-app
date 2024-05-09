
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/widgets/app_card.dart';

class AcceptMessage extends StatefulWidget {
  const AcceptMessage({
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
      title: const Text('Message from Javad'),
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
          child: const Text(
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages"),
        )
      ],
    );
  }
}