import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/image_icon.dart';
import 'package:take_my_tym/features/home/presentation/bloc/nearby_posts_bloc/nearby_posts_bloc.dart';
import 'package:take_my_tym/features/location/presentation/bloc/location_bloc.dart';
import 'package:take_my_tym/features/location/presentation/pages/select_location_page.dart';

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
                child: CoustomImageIcon(
              image: MyAppImages.locationIcon,
              height: 25.h,
              width: 25.h,
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
                    context.read<NearbyPostsBloc>().add(
                          NearbyPostsEvent(
                            latitude: state.latitude,
                            longitude: state.longitude,
                            location: state.placeName,
                          ),
                        );
                    return _LocationWidget(
                      location: state.placeName,
                    );
                  }

                  return _LocationWidget(
                    location:
                        context.read<AppUserBloc>().appUserModel!.location!,
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
