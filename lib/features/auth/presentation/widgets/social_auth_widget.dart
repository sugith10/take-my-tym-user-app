import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/bloc/app_bloc.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/social_auth_bloc/social_auth_bloc.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/pages/navigation_menu.dart';

class SocialAuthWidget extends StatefulWidget {
  const SocialAuthWidget({super.key});

  @override
  State<SocialAuthWidget> createState() => _SocialAuthWidgetState();
}

class _SocialAuthWidgetState extends State<SocialAuthWidget> {
  final SocialAuthBloc _bloc = SocialAuthBloc();

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 800),
      duration: const Duration(milliseconds: 900),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 0.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or continue with',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    thickness: 0.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<SocialAuthBloc, SocialAuthState>(
                  bloc: _bloc,
                  listener: (context, state) {
                    if (state is SocialAuthFailState) {
                      SnackBarMessenger().showSnackBar(
                        context: context,
                        errorMessage: state.errorMessage,
                        errorDescription: state.errorDescription,
                      );
                    }
                    if (state is SocialAuthSuccessState) {
                      context.read<AppBloc>().add(UpdateAppUserModelEvent(
                          appUserModel: state.userModel));
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const NavigationMenu()),
                        (route) => false,
                      );
                      //            Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const ProfileSetupPage()),
                      //   ((route) => false)
                      // );
                    }
                  },
                  builder: (context, state) {
                    if (state is SocialAuthLoadingState) {
                      return const SizedBox(
                        height: 65,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is SocialAuthSuccessState) {
                      return const SizedBox(
                        height: 65,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    return GestureDetector(
                      onTap: () {
                        _bloc.add(GoogleSignEvent());
                      },
                      child: Container(
                        height: 65,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(238, 238, 238, 1)),
                        child: Center(
                          child: Image.asset(
                            MyAppImages.google,
                            height: 35,
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
