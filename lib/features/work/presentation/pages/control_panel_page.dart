import 'package:flutter/material.dart';

import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../core/widgets/app_bar/settings_button.dart';
import '../../../proposals/presentation/pages/proposals_tab.dart';
import '../../../wallet/presentation/pages/wallet_page.dart';
import 'contracts_tab.dart';


class ControlPanelPage extends StatelessWidget {
  const ControlPanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Workspace"),
          actions: [SettingsButton(callback: () {})],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Proposals',
              ),
              Tab(
                text: 'Contracts',
              ),
              Tab(text: 'Wallet'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            //Proposals
            ProposalsStatusTab(),
            //Contracts
            ContractsTab(),
            //Wallet
            WalletPage(),
          ],
        ),
      ),
    );
  }
}