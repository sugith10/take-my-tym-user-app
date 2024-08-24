import 'package:flutter/material.dart';

class ServiceTypeWidget extends StatelessWidget {
  final String type;
  const ServiceTypeWidget({
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Service Type: $type',
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}