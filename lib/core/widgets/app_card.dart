import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class AppCard extends StatelessWidget {
  final VoidCallback voidCallback;
  final double width;
  final double? height;
  final Widget child;
  const AppCard({
    super.key,
    required this.voidCallback,
    required this.width,
    this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // clipper: _CustomClipper(),
      child: GestureDetector(
        onTap: () {
          voidCallback();
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppDarkColor.instance.secondaryBackground,
            borderRadius: BorderRadius.circular(
              MyAppRadius.borderRadius,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              MyAppRadius.borderRadius,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

// class _CustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     double w = size.width;
//     double h = size.height;

//     path.lineTo(0, h);
//     path.lineTo(w, h);
//     path.lineTo(w, -20);
//     // path.quadraticBezierTo(, y1, x2, y2)
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
