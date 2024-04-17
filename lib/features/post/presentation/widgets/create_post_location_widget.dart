import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/location/presentation/bloc/location_bloc.dart';
import 'package:take_my_tym/features/location/presentation/pages/select_location_page.dart';

class CreatePostLocationWidget extends StatelessWidget {
  final LocationBloc locationBloc;
  final TextStyle? style;
  final double gap;
  const CreatePostLocationWidget({
    required this.locationBloc,
    super.key, required this.style, required this.gap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: style,
        ),
        SizedBox(height: gap),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SelectLocationPage(locationBloc: locationBloc),
              ),
            );
          },
          borderRadius: BorderRadius.circular(
            MyAppRadius.borderRadius,
          ),
          child: Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: MyAppDarkColor.instance.secondaryBorder,
              ),
              borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
            ),
            child: HomePadding(
              child: Align(
                alignment: Alignment.centerLeft,
                child: BlocBuilder(
                  bloc: locationBloc,
                  builder: (context, state) {
                    if (state is LocationResultState) {
                      return Text(
                        state.placeName,
                        style: Theme.of(context).textTheme.labelLarge,
                      );
                    }
                    return Text(
                      'Location',
                      style: Theme.of(context).textTheme.bodyLarge,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
