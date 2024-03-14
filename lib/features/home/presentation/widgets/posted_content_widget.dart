import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';

class PostedContent extends StatelessWidget {
  final String? image;
  final String service;
  final String title;
  const PostedContent({
    this.image,
    required this.service,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 40, 40, 40),
        borderRadius: BorderRadius.circular(MyAppPadding.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(MyAppPadding.borderRadius),
        child: Column(children: [
          SizedBox(
            child: image != null
                ? Column(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(MyAppPadding.borderRadius),
                        child: Image.asset(
                          image!,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                          height: 120.h,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Service Tyep: $service',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          )
        ]),
      ),
    );
  }
}
