import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

class CircleProfilePicWidget extends StatelessWidget {
  final double width;
  final double height;
  final XFile? image;
  final bool animation;
  const CircleProfilePicWidget({
    super.key,
    this.animation = true,
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
        : animation
            ? RiveAnimatedIcon(
                riveIcon: RiveIcon.profile,
                width: width / 1.5,
                height: height / 1.5,
                color: AppDarkColor.instance.primaryText,
                loopAnimation: false,
              )
            : const Icon(IconlyBroken.profile);
  }
}

class _CircleContainer extends StatelessWidget {
  const _CircleContainer({
    required this.width,
    required this.height,
    required this.child,
  });

  final double width;
  final double height;
  final Widget child;

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
      child: ClipRRect(borderRadius: BorderRadius.circular(100), child: child),
    );
  }
}
