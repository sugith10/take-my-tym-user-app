import 'package:flutter/material.dart';

import '../../../../core/widgets/panel_title_widget.dart';
import '../../../proposals/presentation/widgets/offer_list_tile.dart';
import 'view_contract_page.dart';


class ContractsTab extends StatelessWidget {
  const ContractsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PanelTitleWidget(
          title: 'Active Contracts',
        ),
        OfferListTile(
          text: 'Lorem Ipsum is simply dummy text of the',
          onPressed: () {
          Navigator.push(context, ViewContractPage.route());
          },
        ),
      ],
    );
  }
}
