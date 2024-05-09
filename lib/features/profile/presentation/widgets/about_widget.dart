import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/widgets/home_padding.dart';


class AboutWidget extends StatelessWidget {
  const AboutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomePadding(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
             context.read<AppUserBloc>().userModel!.about!,
              style: Theme.of(context).textTheme.labelMedium,
              // maxLines: 5,
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
