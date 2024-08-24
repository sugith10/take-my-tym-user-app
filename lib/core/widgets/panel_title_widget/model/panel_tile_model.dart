class PanelTileModel {
  final String title;
  final String? expandedTitle;
  final String description;
  final String details;
  final bool padding;

  PanelTileModel({
    required this.title,
    this.expandedTitle,
    required this.description,
    required this.details,
    this.padding = true,
  });
}
