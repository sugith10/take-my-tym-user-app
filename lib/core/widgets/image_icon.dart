import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  const CustomIcon({required this.image,required this.width, required this.height, super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image), 
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}