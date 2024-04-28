import 'dart:io';

import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_assets.dart';

class CircleProfilePicWidget extends StatelessWidget {
  final double width;
  final double height;
  final File? image;
  const CircleProfilePicWidget({
    super.key,
    required this.width,
    required this.height,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2.5,
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: image != null
            ? ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.file(
                  image!,
                  fit: BoxFit.cover,
                ),
            )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(child: Image.asset(MyAppImages.profileIcon)),
              ),
      ),
    );
  }
}
