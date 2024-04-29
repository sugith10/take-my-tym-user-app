import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/app_bar_title.dart';
import 'package:take_my_tym/core/widgets/settings_button.dart';
import 'package:take_my_tym/features/control_panel/presentation/pages/contracts_tab.dart';
import 'package:take_my_tym/features/control_panel/presentation/pages/proposals_tab.dart';
import 'package:take_my_tym/features/control_panel/presentation/pages/wallet_widget.dart';

class ControlPanelPage extends StatelessWidget {
  const ControlPanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Control Panel"),
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
            ProposalsTab(),
            //Contracts
            ContractsTab(),
            //Wallet
            WalletWidget(),
          ],
        ),
      ),
    );
  }
}



