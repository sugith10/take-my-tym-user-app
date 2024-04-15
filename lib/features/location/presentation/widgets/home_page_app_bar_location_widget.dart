import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/image_icon.dart';
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
  late final LocationBloc _locationBloc;

  @override
  void initState() {
    super.initState();
    _locationBloc = context.read<LocationBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectLocationPage(
                locationBloc: _locationBloc,
              ),
            ),
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
                    return SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text( state.placeName,
                              style: Theme.of(context).textTheme.labelMedium),
                          Text(
                            "Kerala, Indaia",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(fontSize: 11.sp),
                          ),
                        ],
                      ),
                    );
                  }
                  return SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No Location Provide",
                            style: Theme.of(context).textTheme.labelMedium),
                      ],
                    ),
                  );
                }),
            SizedBox(width: 5.sp),
            const SizedBox(child: Icon(IconlyLight.arrow_down_2)),
          ],
        ));
  }
}
