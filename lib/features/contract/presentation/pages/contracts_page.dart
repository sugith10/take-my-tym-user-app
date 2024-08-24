import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/user_bloc/user_bloc.dart';
import '../../../../core/route/route_name/app_route_name.dart';
import '../../../../core/widgets/auth_padding.dart';
import '../../../../core/widgets/empty_list_text.dart';
import '../../../../core/widgets/panel_title_widget/panel_title_widget.dart';
import '../../../../core/widgets/offer_list_tile.dart';
import '../../../../core/widgets/shimmer_common_widget.dart';
import '../bloc/contracts_bloc/contracts_bloc.dart';
import '../model/contract_panel_tile_model.dart';
import '../widgets/contract_tab_buttons.dart';

class ContractsPage extends StatefulWidget {
  const ContractsPage({super.key});

  @override
  State<ContractsPage> createState() => _ContractsPageState();
}

class _ContractsPageState extends State<ContractsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ContractsBloc>().add(
          GetActiveContractsEvent(
              userId: context.read<UserBloc>().userModel!.uid),
        );
  }

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
              AuthPadding(
                child: BlocBuilder<ContractsBloc, ContractsState>(
                    builder: (context, state) {
                  return PanelTileWidget(
                    panelTileModel: context.read<ContractsBloc>().type
                        ? ContractPanelTileModel.activeClient
                        : ContractPanelTileModel.completedClient,
                  );
                }),
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
                          final contractModel = state.contractList[index];
                          return OfferListTile(
                            text: contractModel.contractName,
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteName.viewContract,
                                  arguments: contractModel);
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
              AuthPadding(
                child: PanelTileWidget(
                  panelTileModel: context.read<ContractsBloc>().type
                      ? ContractPanelTileModel.activeServiceProvider
                      : ContractPanelTileModel.completedServiceProvider,
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
                            final contractModel =
                                state.serviceProviderList[index];
                            return OfferListTile(
                              text: contractModel.contractName,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteName.viewContract,
                                    arguments: contractModel);
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
