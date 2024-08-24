class AutoCompletePrediction{
  /// [description] contains the human-readable for the returned result.
  /// the business name.
  final String? description;

  /// [structuredFormatting] provides pre-formated text that can be shown in
  final StructuredFormatting? structuredFormatting;

  /// [placeId] is a textual indentifier that uniquely identifies a place. To
  /// pass this indentifier in the placeId field of a Places API request. For
  final String? placeId;

  /// [reference] conatins reference.
  final String? reference;

  AutoCompletePrediction({
    this.description,
    this.structuredFormatting,
    this.placeId,
    this.reference,
  });

  factory AutoCompletePrediction.fromJson(Map<String,dynamic> json){
    return AutoCompletePrediction(
      description: json['description'] as String?,
      placeId: json['place_id'] as String?,
      reference: json['reference'] as String?,
      structuredFormatting: json['structured_formatting'] != null
        ? StructuredFormatting.fromJson(json['structured_formatting']): null,

    );
  }
}

class StructuredFormatting{
  /// [mainText] contains the main text of a prediction, usually the name of
  final String? mainText;

  /// [secondaryText] contains the secondary text of a prediction, usually the 
  final String? secondaryText;

  StructuredFormatting({this.mainText, this.secondaryText});

  factory StructuredFormatting.fromJson(Map<String,dynamic> json){
    return StructuredFormatting(
      mainText: json['main_text'] as String?,
      secondaryText: json['secondary_text'] as String?,
    );
  }
}