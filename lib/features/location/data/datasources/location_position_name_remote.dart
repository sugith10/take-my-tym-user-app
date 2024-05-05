import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:take_my_tym/core/secret/google_map_api_key.dart';

final class CurrentLocationRemote{
  
Future<String> locationPositionName({required  double latitude,required double longitude}) async {
  Uri uri = Uri.https(
    'maps.googleapis.com',
    '/maps/api/geocode/json',
    {
      'latlng': '$latitude,$longitude',
      'key': dotenv.env["GOOGLE_MAP_API_KEY"]!,
    },
  );

  try {
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      log(json.toString());
      if (json['results'].isNotEmpty) {

        var formattedAddress = json['results'][0]['formatted_address'];
        if (formattedAddress != null) {
          return formattedAddress;
        } else {
          // Handle missing formatted address
          return 'No detailed address available, but location data retrieved.';
        }
      } else {
        return 'No location data found for these coordinates.';
      }
    } else {
      throw Exception('Failed to load location name (Status Code: ${response.statusCode})');
    }
  } catch (e) {
    // Handle other exceptions
    rethrow;
  }
}
}