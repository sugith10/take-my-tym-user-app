import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/secret/google_map_api_key.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/features/location/data/models/auto_complete_prediction.dart';
import 'package:take_my_tym/features/location/data/models/place_auto_complete_response.dart';
import 'package:take_my_tym/features/location/data/datasources/location_data.dart';
import 'package:take_my_tym/features/location/presentation/widgets/google_text.dart';
import 'package:take_my_tym/features/location/presentation/widgets/location_divider.dart';
import 'package:take_my_tym/features/location/presentation/widgets/location_list_tile_widget.dart';
import 'package:take_my_tym/features/location/presentation/widgets/location_page_appbar.dart';

class SelectLocationPage extends StatefulWidget {
  const SelectLocationPage({super.key});

  @override
  State<SelectLocationPage> createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  final TextEditingController _locationController = TextEditingController();

  List<AutoCompletePrediction> placePrdictions = [];

  void placeAutocomplate(String query) async {
    log("on placeAutoComplate");
    Uri uri =
        Uri.https("maps.googleapis.com", "maps/api/place/autocomplete/json", {
      "input": query,
      "key": googleMapApiKey,
    });
    String? response = await LocationData().fetchUrl(uri);

    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePrdictions = result.predictions!;
        });
      }
    }
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LocationPageAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(MyAppPadding.homePadding),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: _locationController,
              onChanged: (value) {
                placeAutocomplate(value);
                // searchBloc.add(SearchBuyTymPost(searchQuery: value));
              },
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              cursorColor: MyAppDarkColor().primaryText,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(
                    IconlyLight.search,
                    color: Colors.white,
                  ),
                ),
                filled: true,
                fillColor: MyAppDarkColor().fillColor,
                hintText: 'Search for area...',
                hintStyle: Theme.of(context).textTheme.labelLarge,
              ),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const LocationDivider(),
          Padding(
            padding: const EdgeInsets.all(MyAppPadding.homePadding),
            child: ElevatedButton(
              onPressed: () {
                // placeAutocomplate("Dubai");
              },
              style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                      Size(double.infinity, kToolbarHeight))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(IconlyLight.discovery),
                  SizedBox(width: 10),
                  Text("Use current location")
                ],
              ),
            ),
          ),
          const LocationDivider(),
          Expanded(
            child: ListView.builder(
              itemCount: placePrdictions.length,
              itemBuilder: (context, index) {
                return  LocationListTile(
                  callback: () {},
                  location: placePrdictions[index].description!,
                );
              },
            ),
          ),
          const PoweredByGoogleText()
        ],
      ),
    );
  }
}