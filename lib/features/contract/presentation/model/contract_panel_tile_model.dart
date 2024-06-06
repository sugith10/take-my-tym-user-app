import '../../../../core/widgets/panel_title_widget/model/panel_tile_model.dart';

class ContractPanelTileModel {
  ContractPanelTileModel._();
  static PanelTileModel activeClient = PanelTileModel(
    title: 'Client Contracts',
    expandedTitle: "Active Client Contracts",
    padding: false,
    description:
        "In this section, you can view all your active client contracts.",
    details:
        "Here, you can see all the contracts that have been hired by you, including contract terms, services being provided, and service provider details.",
  );

  static PanelTileModel activeServiceProvider = PanelTileModel(
    title: 'Service Provider Contracts',
    expandedTitle: 'Active Service Provider Contracts',
    padding: false,
    description:
        "In this section, you can see the contracts you are actively providing services for.",
    details:
        "You can view the contracts that you have signed as the service provider, including contract terms, services to be provided, and client details.",
  );

    static PanelTileModel completedClient = PanelTileModel(
    title: 'Client Contracts',
    expandedTitle: "Completed Client Contracts",
    padding: false,
    description:
        "In this section, you can view all your completed client contracts.",
    details:
        "Here, you can see all the contracts that have been hired by you, including contract terms, services being provided, and service provider details.",
  );
    static PanelTileModel completedServiceProvider = PanelTileModel(
    title: 'Service Provider Contracts',
    expandedTitle: 'Completed Service Provider Contracts',
    padding: false,
    description:
        "In this section, you can see the contracts you previously provided services for.",
    details:
        "You can view the contracts that you have signed as the service provider, including contract terms, services to be provided, and client details.",
  );
}
