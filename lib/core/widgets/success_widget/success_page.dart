import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym/core/navigation/screen_transitions/no_movement.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_sound_player.dart';
import 'package:take_my_tym/core/utils/app_vibration.dart';
import 'package:take_my_tym/core/widgets/close_icon_button.dart';
import 'package:take_my_tym/core/widgets/success_widget/bloc/success_page_bloc.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/pages/navigation_menu.dart';
import 'package:take_my_tym/features/post/presentation/widgets/scale_up.dart';

part 'util/feedback.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

   static route() => noMovement(const SuccessPage());

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
          Navigator.pushAndRemoveUntil(
            context,
            NavigationMenu.route(),
            (route) => false,
          );
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
                    Lottie.asset(MyAppImages.successLottie,
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
                        color: MyAppDarkColor.instance.primaryTextSoft),
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
                            return Text('${state.timeLeft} :  seconds');
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      const SizedBox(height: 40),
                      CloseIconButton(
                        callback: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            NavigationMenu.route(),
                            (route) => false,
                          );
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: MyAppDarkColor.instance.secondaryText,
                        ),
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
