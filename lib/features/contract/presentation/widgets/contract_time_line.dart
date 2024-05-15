import 'package:flutter/material.dart';

import '../../../../core/widgets/contract_timeline_widget.dart';
import '../../data/models/contract_model.dart';

class ContractTimeLine extends StatelessWidget {
  const ContractTimeLine({
    super.key,
    required this.contractModel,
  });

  final ContractModel contractModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TimeLineTileWidget(
          isFirst: true,
          isLast: false,
          isPast: true,
          text: "Contract Started",
        ),
        const TimeLineTileWidget(
          isFirst: false,
          isLast: false,
          isPast: true,
          text: "Payment Completed",
        ),
        TimeLineTileWidget(
          isFirst: false,
          isLast: true,
          isPast: contractModel.contractEnded,
          text: "Project Completed",
        ),
      ],
    );
  }
}
