import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGImageWidget extends StatelessWidget {
  final String asset;
  final double height;
  final double width;
  final double paddingR;
  final double paddingL;
  final double paddingB;
  final double paddingT;
  const SVGImageWidget({
    required this.asset,
    this.height = 0,
    this.width = 0,
    this.paddingR = 0,
    this.paddingL = 0,
    this.paddingB = 0,
    this.paddingT = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: paddingL,
        right: paddingR,
        bottom: paddingB,
        top: paddingT,
      ),
      child: SvgPicture.asset(
        asset,
        height: 40,
      ),
    );
  }
}