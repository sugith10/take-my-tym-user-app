import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/post_types.dart';

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
            label: Text(MyAppPostType.remote),
          ),
          ButtonSegment<String>(
            value: MyAppPostType.onsite,
            label: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(MyAppPostType.onsite),
            ),
          ),
        ],
        selected: _selection,
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
          side: MaterialStatePropertyAll(
              BorderSide(color: MyAppDarkColor.instance.primarySoftBorder)),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(5)),
          backgroundColor: const MaterialStatePropertyAll(
            Colors.transparent,
          ),
          foregroundColor: const MaterialStatePropertyAll(
            Color.fromARGB(255, 254, 254, 254),
          ),
        ),
      ),
    );
  }
}
