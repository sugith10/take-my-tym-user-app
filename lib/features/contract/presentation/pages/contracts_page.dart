import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import '../../../../core/widgets/empty_list_text.dart';
import '../../../../core/widgets/panel_title_widget.dart';
import '../../../../core/widgets/offer_list_tile.dart';
import '../../../../core/widgets/shimmer_common_widget.dart';
import '../bloc/contracts_bloc/contracts_bloc.dart';
import '../widgets/contract_tab_buttons.dart';
import 'view_contract_page.dart';

class ContractsPage extends StatelessWidget {
  const ContractsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          const AuthPadding(child: ContractTabButtons()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthPadding(
                child: PanelTitleWidget(
                  title: 'Client Contracts',
                  padding: false,
                ),
              ),
              BlocBuilder<ContractsBloc, ContractsState>(
                builder: (context, state) {
                  if (state is ContractsLoadedState) {
                    if (state.contractList.isEmpty) {
                      return const EmptyListText(padding: 50);
                    } else {
                      return ListView.builder(
                        itemCount: state.contractList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final contract = state.contractList[index];
                          return OfferListTile(
                            text: contract.contractName,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  ViewContractPage.route(
                                      contractModel: contract));
                            },
                          );
                        },
                      );
                    }
                  }
                  if (state is ContractsLoadingState) {
                    return const ShimmerCommonWidget();
                  }
                  return const Center(
                    child: Text("Error"),
                  );
                },
              ),
              const AuthPadding(
                child: PanelTitleWidget(
                  title: 'Service Provider Contracts',
                  padding: false,
                ),
              ),
              BlocBuilder<ContractsBloc, ContractsState>(
                builder: (context, state) {
                  if (state is ContractsLoadedState) {
                    if (state.serviceProviderList.isEmpty) {
                      return const EmptyListText(padding: 50);
                    } else {
                      return ListView.builder(
                          itemCount: state.serviceProviderList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final contract = state.serviceProviderList[index];
                            return OfferListTile(
                              text: contract.contractName,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    ViewContractPage.route(
                                        contractModel: contract));
                              },
                            );
                          });
                    }
                  }
                  if (state is ContractsLoadingState) {
                    return const ShimmerCommonWidget();
                  }
                  return const Center(
                    child: Text("Error"),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
