import 'package:flutter/material.dart';
import 'package:take_my_tym/features/contract/presentation/pages/contracts_page.dart';

import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../core/widgets/app_bar/settings_button.dart';
import '../../../proposal/presentation/pages/proposals_page.dart';
import '../../../wallet/presentation/pages/wallet_page.dart';

class WorkTabBar extends StatelessWidget {
  const WorkTabBar({super.key});

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
            ProposalPage(),
            ContractsPage(),
            WalletPage(),
          ],
        ),
      ),
    );
  }
}
