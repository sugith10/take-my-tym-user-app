import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'widget/scale_up_animation.dart';
import '../../../features/navigation_menu/presentation/pages/home_navigation_menu.dart';
import '../../navigation/screen_transitions/no_movement.dart';
import '../../utils/assets/app_audio.dart';
import '../../utils/assets/app_lottie.dart';
import '../../utils/theme/color/app_colors.dart';
import '../../utils/app_sound_player.dart';
import '../../utils/app_vibration.dart';
import '../close_icon_button.dart';
import 'bloc/success_page_bloc.dart';

part 'util/feedback.dart';

class SuccessPage extends StatefulWidget {
  final bool pop;
  final String title;
  final String subtitle;
  const SuccessPage(
      {required this.title,
      required this.subtitle,
      required this.pop,
      super.key});

  static route(
          {bool pop = false,
          required String title,
          required String subtitle}) =>
      noMovement(
        SuccessPage(title: title, subtitle: subtitle, pop: pop),
      );

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  final SuccessPageBloc _successPageBloc = SuccessPageBloc();

  @override
  void initState() {
    super.initState();
    // Provides haptic feedback, plays sound
    _Feedback.call();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _successPageBloc,
      listener: (context, state) {
        if (state is SuccessPageExistState) {
          if (widget.pop) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          } else {
            Navigator.pushAndRemoveUntil(
                context, HomeNavigationMenu.route(), (route) => false);
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Lottie.asset(AppLottie.success,
                        repeat: false, height: 500, width: 500),
                    FadeIn(
                      delay: const Duration(milliseconds: 1500),
                      duration: const Duration(milliseconds: 1500),
                      child: const Center(
                        child: ScaleUpAnimationWidget(),
                      ),
                    ),
                  ],
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 1500),
                  duration: const Duration(milliseconds: 1500),
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppDarkColor.instance.primaryTextSoft,
                          letterSpacing: .5,
                        ),
                  ),
                ),
                SizedBox(height: 10.h),
                FadeInDown(
                  delay: const Duration(milliseconds: 1500),
                  duration: const Duration(milliseconds: 1500),
                  child: Text(
                    widget.subtitle,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppDarkColor.instance.primaryTextSoft),
                  ),
                ),
                const Spacer(),
                FadeIn(
                  delay: const Duration(milliseconds: 2550),
                  duration: const Duration(milliseconds: 2550),
                  child: Column(
                    children: [
                      const Text('This page will automatically closed in'),
                      const SizedBox(height: 5),
                      BlocBuilder(
                        bloc: _successPageBloc,
                        builder: (context, state) {
                          if (state is SuccessPageTimeLeftState) {
                            return Column(
                              children: [
                                Text('${state.timeLeft} :  seconds'),
                                const SizedBox(height: 40),
                                CloseIconButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      HomeNavigationMenu.route(),
                                      (route) => false,
                                    );
                                  },
                                  child: Icon(
                                    Icons.close_rounded,
                                    color: AppDarkColor.instance.secondaryText,
                                  ),
                                )
                              ],
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
