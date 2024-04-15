import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

final class LocationTurnedOff {
  dailog(
      {required BuildContext context,
      required VoidCallback enableLocation,
      required VoidCallback cancel}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
            child: Text(
          'Location Services Disabled',
          style: TextStyle(color: MyAppDarkColor.instance.danger),
        )),
        content: const Text(
          'Please enable location services to use this feature.',
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  enableLocation();
                },
                child: const Text('Enable Location'),
              ),
              TextButton(
                onPressed: () => cancel,
                child: const Text(
                  'Cancel',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
