import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/app_bar_title.dart';
import 'package:take_my_tym/core/widgets/settings_button.dart';
import 'package:take_my_tym/features/work/presentation/pages/contracts_tab.dart';
import 'package:take_my_tym/features/proposals/presentation/pages/proposals_tab.dart';
import 'package:take_my_tym/features/wallet/presentation/pages/wallet_page.dart';

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
