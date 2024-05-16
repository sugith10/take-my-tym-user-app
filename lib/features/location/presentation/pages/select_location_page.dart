import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/navigation/screen_transitions/bottom_to_top.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_debouncer.dart';
import '../../../../core/utils/app_padding.dart';
import '../../data/models/auto_complete_prediction.dart';
import '../bloc/location_bloc.dart';
import '../widgets/google_text.dart';
import '../widgets/location_divider.dart';
import '../widgets/location_page_appbar.dart';
import '../widgets/location_permission_denied_dialog.dart';
import '../widgets/location_text_field.dart';
import '../widgets/location_turned_off_dialog.dart';
import '../widgets/search_location_result_widget.dart';


class SelectLocationPage extends StatefulWidget {
  final LocationBloc locationBloc;
  const SelectLocationPage({
    required this.locationBloc,
    super.key,
  });

  static route({required LocationBloc locationBloc}) => bottomToTop(
        SelectLocationPage(
          locationBloc: locationBloc,
        ),
      );

  @override
  State<SelectLocationPage> createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  final TextEditingController _locationController = TextEditingController();

  List<AutoCompletePrediction> placePrdictions = [];

  final _debouncer = Debouncer(milliseconds: 500);

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
            child: LocationTextField(
                locationController: _locationController,
                debouncer: _debouncer,
                locationBloc: widget.locationBloc),
          ),
          const LocationDivider(),
          Padding(
            padding: const EdgeInsets.all(MyAppPadding.homePadding),
            child: ElevatedButton(
              onPressed: () {
                widget.locationBloc.add(CurrentLocationEvent());
              },
              style: const ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                      Size(double.infinity, kToolbarHeight))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: AppDarkColor.instance.danger,
                  ),
                  const SizedBox(width: 10),
                  const Text("Use current location")
                ],
              ),
            ),
          ),
          const LocationDivider(),
          BlocConsumer(
            bloc: widget.locationBloc,
            listener: (context, state) {
              if (state is LocationTurnedOffState) {
                LocationTurnedOff().dailog(
                    context: context,
                    enableLocation: () {
                      Geolocator.openLocationSettings();
                      Navigator.pop(context);
                    },
                    cancel: () {
                      Navigator.pop(context);
                    });
              }
              if (state is LocationPermissionDeniedForeverState) {
                LocationPermissionDenied().dialog(context: context);
              }
              if (state is LocationResultState) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              if (state is LocationInitialState) {
                return const PoweredByGoogleText();
              }
              if (state is LocationLoadingState) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is SearchLocationsResultsState) {
                return SearchLocationResultWiedget(
                  locationBloc: widget.locationBloc,
                  searchLocationsResultsState: state,
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
