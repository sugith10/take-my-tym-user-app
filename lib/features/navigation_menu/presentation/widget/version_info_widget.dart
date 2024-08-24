import 'package:flutter/material.dart';

import '../utils/version_info_util.dart';

class VersionInfoWidget extends StatelessWidget {
  const VersionInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: VersionInfoUtil.appVersion,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  Text(
            '© 2024 DayProduction®',
            style: Theme.of(context).textTheme.bodyMedium,
          );
        } else if (snapshot.hasError) {
          return Text(
            '© 2024 DayProduction® : vE',
            style: Theme.of(context).textTheme.bodyMedium,
          );
        } else {
          return Text(
            '© 2024 DayProduction® : v${snapshot.data}',
            style: Theme.of(context).textTheme.bodyMedium,
          );
        }
      },
    );
  }
}