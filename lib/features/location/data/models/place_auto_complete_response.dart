import 'dart:convert';

import 'package:take_my_tym/features/location/data/models/auto_complete_prediction.dart';

class PlaceAutocompleteResponse{
  final String? status;
  final List<AutoCompletePrediction>? predictions;

  PlaceAutocompleteResponse({this.predictions, this.status});

  factory PlaceAutocompleteResponse.fromJson(Map<String,dynamic> json){
    return PlaceAutocompleteResponse( 
      status: json['status'] as String?,
      predictions: json['predictions']?.map<AutoCompletePrediction>(
          (json) => AutoCompletePrediction.fromJson(json))
          .toList(), 

    );
  }

  static PlaceAutocompleteResponse parseAutocompleteResult(String responseBody){
    final parsed = json.decode(responseBody).cast<String,dynamic>();
    return PlaceAutocompleteResponse.fromJson(parsed);
  }
}