import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/utils/app_assets/app_png.dart';
import '../../../location/presentation/bloc/location_bloc.dart';
import '../../../location/presentation/pages/select_location_page.dart';

class MyLocationWidget extends StatefulWidget {
  const MyLocationWidget({
    super.key,
  });

  @override
  State<MyLocationWidget> createState() => _MyLocationWidgetState();
}

class _MyLocationWidgetState extends State<MyLocationWidget> {
  final LocationBloc _locationBloc = LocationBloc();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(
            context,
            SelectLocationPage.route(locationBloc: _locationBloc),
          );
        },
        icon: Row(
          children: [
            SizedBox(
                child: Image.asset(
              AppPng.location,
              fit: BoxFit.contain,
             height: 25.sp,
              width: 25.sp,
            )),
            SizedBox(width: 10.sp),
            BlocBuilder(
                bloc: _locationBloc,
                builder: (context, state) {
                  if (state is LocationResultState) {
                    context.read<AppUserBloc>().add(
                          UpdateUserLocationEvent(
                            location: state.placeName,
                            latitude: state.latitude,
                            longitude: state.longitude,
                          ),
                        );
                    return _LocationWidget(
                      location: state.placeName,
                    );
                  }

                  return _LocationWidget(
                    location: context.read<AppUserBloc>().userModel!.location!,
                  );
                }),
            SizedBox(width: 5.sp),
            const SizedBox(
              child: Icon(IconlyLight.arrow_down_2),
            ),
          ],
        ));
  }
}

class _LocationWidget extends StatelessWidget {
  final String location;

  const _LocationWidget({required this.location});

  @override
  Widget build(BuildContext context) {
    List<String> parts = location.split(',').map((s) => s.trim()).toList();

    String city = parts.isNotEmpty ? parts[0] : 'Unknown city';
    String rest = parts.length > 1 ? parts.sublist(1).join(', ') : '';

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 100.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(city,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium),
          Text(
            rest,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontSize: 11.sp),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
