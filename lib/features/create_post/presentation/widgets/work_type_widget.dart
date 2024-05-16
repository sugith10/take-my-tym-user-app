import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/post_types.dart';


class WorkTypeWidget extends StatefulWidget {
  final Function(String) function;
  final String selectedWorkType;
  const WorkTypeWidget({
    required this.selectedWorkType,
    required this.function,
    super.key,
  });

  @override
  State<WorkTypeWidget> createState() => _WorkTypeWidgetState();
}

class _WorkTypeWidgetState extends State<WorkTypeWidget> {
  Set<String> _selection = <String>{};

  @override
  void initState() {
    super.initState();
    _selection.add(widget.selectedWorkType);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: SegmentedButton(
        segments: const <ButtonSegment<String>>[
          ButtonSegment<String>(
            value: MyAppPostType.remote,
            label: Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Text(MyAppPostType.remote),
            ),
          ),
          ButtonSegment<String>(
            value: MyAppPostType.onsite,
            label: Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Text(MyAppPostType.onsite),
            ),
          ),
        ],
        selected: _selection,
        selectedIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            IconlyBold.bookmark,
            color: AppDarkColor.instance.success,
          ),
        ),
        onSelectionChanged: (Set<String> newSelection) {
          setState(
            () {
              _selection = newSelection;
              widget.function(newSelection.first);
              log(newSelection.first);
            },
          );
        },
        multiSelectionEnabled: false,
        emptySelectionAllowed: true,
        showSelectedIcon: true,
        style: ButtonStyle(
          visualDensity: VisualDensity.comfortable,
          side: WidgetStatePropertyAll(
              BorderSide(color: AppDarkColor.instance.primarySoftBorder)),
          padding: const WidgetStatePropertyAll(EdgeInsets.all(5)),
          backgroundColor: const WidgetStatePropertyAll(
            Colors.transparent,
          ),
          foregroundColor: const WidgetStatePropertyAll(
            Color.fromARGB(255, 254, 254, 254),
          ),
        ),
      ),
    );
  }
}