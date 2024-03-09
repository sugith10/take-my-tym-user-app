import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_my_tym/core/navigation/route_const.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_in_page.dart';
import 'package:take_my_tym/features/auth/presentation/pages/welcome_page.dart';

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) =>  buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const SignInPage(),
            ),
      ),
       GoRoute(
        path: RouteConstants.signIn,
        pageBuilder: (context, state) =>  buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const SignInPage(),
            ),
      ),
    ],
    redirect: (context, state) async {
          bool isAuthenticated = false;
          if (!isAuthenticated) {
            return '/';
          }
          
        },
  );


CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      });
}
