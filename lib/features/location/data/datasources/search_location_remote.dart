import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:take_my_tym/core/secret/google_map_api_key.dart';

final class SerachLocationRemote {
  Future<String?> autoCompleteLocation({required String query}) async {
     log("on search location");
    Uri uri = Uri.https(
      "maps.googleapis.com",
      "maps/api/place/autocomplete/json",
      {
        "input": query,
        "key": googleMapApiKey,
      },
    );
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        // log(response.body);
        return response.body;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}