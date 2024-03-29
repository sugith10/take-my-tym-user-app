import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/app_view.dart';
import 'package:take_my_tym/features/post/presentation/bloc/create_post_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider<CreatePostBloc>(create: ((context) => CreatePostBloc())),
      ],
      child: const ScreenUtilInit(
        designSize: Size(360, 690),
        splitScreenMode: true,
        minTextAdapt: false,
        fontSizeResolver: FontSizeResolvers.radius,
        child: MyAppView(),
      ),
    );
  }
}
