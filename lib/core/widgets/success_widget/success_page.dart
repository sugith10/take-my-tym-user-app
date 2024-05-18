import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'widget/scale_up.dart';
import '../../../features/navigation_menu/presentation/pages/home_navigation_menu.dart';
import '../../navigation/screen_transitions/no_movement.dart';
import '../../utils/assets/app_audio.dart';
import '../../utils/assets/app_lottie.dart';
import '../../utils/theme/app_colors.dart';
import '../../utils/app_sound_player.dart';
import '../../utils/app_vibration.dart';
import '../close_icon_button.dart';
import 'bloc/success_page_bloc.dart';
part 'util/feedback.dart';

class SuccessPage extends StatefulWidget {
  final bool pop;
  const SuccessPage({required this.pop, super.key});

  static route({bool pop = false}) => noMovement(SuccessPage(pop: pop));

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
                        child: ZoomAnimationWidget(),
                      ),
                    ),
                  ],
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 1500),
                  duration: const Duration(milliseconds: 1500),
                  child: Text("Create Successfully",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 10.h),
                FadeInDown(
                  delay: const Duration(milliseconds: 1500),
                  duration: const Duration(milliseconds: 1500),
                  child: Text(
                    "Your tym post now accessible to the world...",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppDarkColor.instance.primaryTextSoft),
                  ),
                ),
                SizedBox(height: 60.h),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
