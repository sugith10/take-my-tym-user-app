import 'package:flutter/material.dart';

import '../bloc/location_bloc.dart';
import 'location_list_tile_widget.dart';

class SearchLocationResultWiedget extends StatelessWidget {
  const SearchLocationResultWiedget({
    super.key,
    required this.locationBloc,
    required this.searchLocationsResultsState,
  });

  final LocationBloc locationBloc;
  final SearchLocationsResultsState searchLocationsResultsState;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: searchLocationsResultsState.placePrdictions.length,
        itemBuilder: (context, index) {
          return LocationListTile(
            callback: () {
            
              locationBloc.add(
                LocationPositonEvent(
                  place: searchLocationsResultsState.placePrdictions[index],
                  // placeId: searchLocationsResultsState
                  //     .placePrdictions[index].placeId!,
                ),
              );
            },
            location:
                searchLocationsResultsState.placePrdictions[index].description!,
          );
        },
      ),
    );
  }
}
