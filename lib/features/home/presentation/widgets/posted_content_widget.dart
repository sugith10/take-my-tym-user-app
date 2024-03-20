import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: List.generate(20, (index) {
            log(index.toString());
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: MyAppDarkColor().secondaryBackground,
                  borderRadius: BorderRadius.circular(
                    MyAppRadius.borderRadius,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    MyAppRadius.borderRadius,
                  ),
                  child: Column(
                    children: [
                      if (image != null)
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                MyAppRadius.borderRadius,
                              ),
                              child: Image.asset(
                                image!,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width,
                                height: 120.h,
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Service Type: $service',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
