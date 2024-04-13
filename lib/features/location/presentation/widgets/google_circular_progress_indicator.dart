import 'package:flutter/material.dart';

class GoogleColorsCircularProgressIndicator extends StatefulWidget {
  const GoogleColorsCircularProgressIndicator({super.key});

  @override
  State<GoogleColorsCircularProgressIndicator> createState() => _GoogleColorsCircularProgressIndicatorState();
}

class _GoogleColorsCircularProgressIndicatorState extends State<GoogleColorsCircularProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _colorAnimation = TweenSequence<Color?>([
  TweenSequenceItem(
    tween: ColorTween(begin: Colors.blue, end: Colors.red),
    weight: 1,
  ),
  TweenSequenceItem(
    tween: ColorTween(begin: Colors.red, end: Colors.yellow),
    weight: 1,
  ),
  TweenSequenceItem(
    tween: ColorTween(begin: Colors.yellow, end: Colors.green),
    weight: 1,
  ),
  TweenSequenceItem(
    tween: ColorTween(begin: Colors.green, end: Colors.blue),
    weight: 1,
  ),
]).animate(_controller);


    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: _colorAnimation,
    );
  }
}
