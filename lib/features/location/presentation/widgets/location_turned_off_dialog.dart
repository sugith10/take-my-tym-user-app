import 'package:flutter/material.dart';

import '../../../../core/widgets/close_icon_button.dart';


final class LocationTurnedOff {
  dailog(
      {required BuildContext context,
      required VoidCallback enableLocation,
      required VoidCallback cancel}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Center(
            child: Text(
          'Location Services Disabled',
        )),
        content: const Text(
          'Please enable location services to use this feature.',
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CloseIconButton(
                onPressed: () {
                  enableLocation();
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Enable Location',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
              CloseIconButton(
                onPressed: () {
                  cancel();
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
