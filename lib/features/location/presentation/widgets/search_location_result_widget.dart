import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:take_my_tym/features/location/presentation/bloc/location_bloc.dart';
import 'package:take_my_tym/features/location/presentation/widgets/location_list_tile_widget.dart';

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
              log("taped");
              log("place ID:- ${searchLocationsResultsState.placePrdictions[index].placeId!}");
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
