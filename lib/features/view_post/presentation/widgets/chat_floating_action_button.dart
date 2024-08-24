import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/color/app_colors.dart';
import '../../../../core/const/app_radius.dart';
import '../../../../core/widgets/circle_profile_picture_widget.dart';

class ChatFloatingActionButton extends StatefulWidget {
  final VoidCallback callBack;

  const ChatFloatingActionButton({
    required this.callBack,
    super.key,
  });

  @override
  State<ChatFloatingActionButton> createState() =>
      _ChatFloatingActionButtonState();
}

class _ChatFloatingActionButtonState extends State<ChatFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    _topAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.centerLeft, end: Alignment.topRight),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.topRight, end: Alignment.bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.bottomRight, end: Alignment.bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.bottomLeft, end: Alignment.centerLeft),
        weight: 1,
      ),
    ]).animate(_controller);

    _bottomAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.centerRight, end: Alignment.bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.bottomLeft, end: Alignment.topLeft),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween:
            Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.topRight, end: Alignment.centerRight),
        weight: 1,
      ),
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _topAlignmentAnimation;
    _bottomAlignmentAnimation;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppDarkColor.instance.gradientPrimary,
                    AppDarkColor.instance.gradientSecondary,
                  ],
                  begin: _topAlignmentAnimation.value,
                  end: _bottomAlignmentAnimation.value,
                ),
                borderRadius: BorderRadius.circular(
                  AppRadius.borderRound,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppDarkColor.instance.boxShadow,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1.5),
                  ),
                ]),
            child: FloatingActionButton.extended(
              onPressed: () {
                widget.callBack();
              },
              label: Row(
                children: [
                  const CircleProfilePicWidget(
                    height: 30,
                    width: 30,
                  
                  ),
                  SizedBox(width: 10.w),
                  Text("Chat", style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
              backgroundColor: Colors.transparent,
            ),
          );
        });
  }
}
