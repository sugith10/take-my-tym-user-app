import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_debouncer.dart';
import 'package:take_my_tym/features/location/presentation/bloc/location_bloc.dart';

class LocationTextField extends StatelessWidget {
  const LocationTextField({
    super.key,
    required TextEditingController locationController,
    required Debouncer debouncer,
    required this.locationBloc,
  })  : _locationController = locationController,
        _debouncer = debouncer;

  final TextEditingController _locationController;
  final Debouncer _debouncer;
  final LocationBloc locationBloc;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: _locationController,
      onChanged: (value) {
        _debouncer.run(() => locationBloc.add(
              SearchLocationsEvent(query: value),
            ));
      },
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      cursorColor: MyAppDarkColor.instance.primaryText,
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Icon(
            IconlyLight.search,
            color: Colors.white,
          ),
        ),
        filled: true,
        fillColor: MyAppDarkColor.instance.fillColor,
        hintText: 'Search for area...',
        hintStyle: Theme.of(context).textTheme.labelLarge,
      ),
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}