import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/features/work/presentation/pages/view_contract_page.dart';
import 'package:take_my_tym/features/work/presentation/widgets/offer_list_tile.dart';
import 'package:take_my_tym/core/widgets/panel_title_widget.dart';

class ContractsTab extends StatelessWidget {
  const ContractsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AuthPadding(
      child: Column(
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
      ),
    );
  }
}
