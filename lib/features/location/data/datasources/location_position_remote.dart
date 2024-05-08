import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:take_my_tym/core/utils/app_exception.dart';

final class LocationPositionRemote {
  Future<Map<String, dynamic>> fetchLocationPosition({
    required String placeId,
  }) async {
    Uri uri = Uri.https('maps.googleapis.com', '/maps/api/place/details/json', {
      'place_id': placeId,
      'fields':
          'geometry', // Specify here the fields you need, for instance, geometry
      'key':dotenv.env["GOOGLE_MAP_API_KEY"]!,
    });

    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse['status'] == 'OK') {
          // Extract the latitude and longitude
          double lat = decodedResponse['result']['geometry']['location']['lat'];
          double lng = decodedResponse['result']['geometry']['location']['lng'];
          return {'latitude': lat, 'longitude': lng};
        } else {
          throw AppException(
              details:
                  'Failed to fetch place details: ${decodedResponse['error_message']}');
        }
      } else {
        throw Exception('Failed to fetch place details');
      }
    } catch (e) {
      throw AppException(alert: e.toString());
    }
  }
}
