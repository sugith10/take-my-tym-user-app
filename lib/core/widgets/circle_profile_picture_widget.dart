import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:take_my_tym/core/assets/app_png.dart';

class CircleProfilePicWidget extends StatelessWidget {
  final double width;
  final double height;
  final XFile? image;

  const CircleProfilePicWidget({
    super.key,
    required this.width,
    required this.height,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return image != null
        ? _CircleContainer(
            width: width,
            height: height,
            border: 2.5,
            child: Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.file(
                File(image!.path),
                fit: BoxFit.cover,
              ),
            ),
          )
        : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AppPng.profileIcon,
            height: height /2,
            width: width /2,
          ),
        );
  }
}

class _CircleContainer extends StatelessWidget {
  const _CircleContainer({
    required this.width,
    required this.height,
    required this.child,
    required this.border,
  });

  final double width;
  final double height;
  final double border;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: border,
        ),
        shape: BoxShape.circle,
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(100), child: child),
    );
  }
}
