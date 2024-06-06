import 'package:take_my_tym/core/widgets/panel_title_widget/model/panel_tile_model.dart';

class ProposalPanelTileModel {
  ProposalPanelTileModel._();

  static PanelTileModel offer = PanelTileModel(
      title: "Proposed Offers",
      description:
          "In this section, you can see all proposals you received for your posts.",
      details:
          "Here, you can accept or reject the offers. Make sure you carefully read each proposal and act accordingly.");

  static PanelTileModel submitted = PanelTileModel(
    title: 'Submitted proposals',
    description:
        "In this section, you can see all proposals you submitted for others' posts.",
    details:
        "Here, you can see the current status of your proposals. If your proposal gets approved, it will be automatically redirected to the Contracts page.",
  );
}
