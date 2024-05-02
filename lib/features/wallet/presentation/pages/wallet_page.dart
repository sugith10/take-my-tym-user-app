import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:take_my_tym/core/utils/app_assets.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:take_my_tym/features/wallet/presentation/widgets/transaction_tile.dart';
import 'package:take_my_tym/features/wallet/presentation/widgets/transactions_view_setup_widget.dart';
import 'package:take_my_tym/features/wallet/presentation/widgets/wallet_card_widget.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        if (state is WalletLoadedState) {
          return ListView(
            children: [
              const SizedBox(height: 20),
              HomePadding(
                child: ShimmerPro.sized(
                  light: ShimmerProLight.lighter,
                  scaffoldBackgroundColor: MyAppDarkColor.instance.background,
                  height: 150.h,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              ShimmerPro.generated(
                light: ShimmerProLight.lighter,
                scaffoldBackgroundColor:
                    Colors.transparent,
                child: Column(
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ShimmerPro.text(
                        maxLine: 3,
                        light: ShimmerProLight.lighter,
                        width: 450,
                        scaffoldBackgroundColor:
                            MyAppDarkColor.instance.background,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        if (state is WalletLoadingState) {
          return HomePadding(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const WalletCard(balance: 0),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                TransactionsViewSetupWidget(
                  function: () {},
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 400.h,
                      maxWidth: 800.h,
                    ),
                    child: ListView.builder(
                        itemCount: 25,
                        itemBuilder: (context, index) {
                          return const HomePadding(
                            child: TransactionTile(
                              name: 'Fletcher',
                              image: MyAppImages.testProfile,
                              time: '15 Dec, 5:00 PM',
                              amount: '15,000',
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          );
        }
        if (state is WalletLoadingState) {
          return const CircularProgressIndicator();
        }
        return const Center(
          child: Text("Something went wrong"),
        );
      },
    );
  }
}
