import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/app_view.dart';
import 'package:take_my_tym/core/bloc/app_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/sign_out_bloc/sign_out_bloc.dart';
import 'package:take_my_tym/features/message/presentation/bloc/chat_list_bloc/chat_list_bloc.dart';
import 'package:take_my_tym/features/message/presentation/bloc/individual_message_bloc/individual_message_bloc.dart';
import 'package:take_my_tym/features/post/presentation/bloc/create_post_bloc/create_post_bloc.dart';
import 'package:take_my_tym/features/post/presentation/bloc/create_skill_bloc/create_skill_bloc.dart';
import 'package:take_my_tym/features/post/presentation/bloc/delete_post_bloc/delete_post_bloc.dart';
import 'package:take_my_tym/features/post/presentation/bloc/read_post_bloc/read_post_bloc.dart';
import 'package:take_my_tym/features/profile/presentation/bloc/bloc/update_profile_bloc.dart';
import 'package:take_my_tym/features/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:take_my_tym/features/post/presentation/bloc/update_post_bloc/update_post_bloc.dart';
import 'package:take_my_tym/features/home/presentation/bloc/community_posts_bloc/community_posts_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider<AppBloc>(create: ((context) => AppBloc())),
        BlocProvider<SignOutBloc>(create: (context) => SignOutBloc()),
        BlocProvider<ReadPostsBloc>(
            create: (context) => ReadPostsBloc()
              ..add(GetBuyTymPostsEvent(
                  userId: context.read<AppBloc>().appUserModel!.uid))),
        BlocProvider<CommunityPostsBloc>(
            create: (context) =>
                CommunityPostsBloc()..add(BuyTymCommunityPostsEvent())),
        BlocProvider<CreatePostBloc>(create: ((context) => CreatePostBloc())),
        BlocProvider<CreateSkillBloc>(create: ((context) => CreateSkillBloc())),
        BlocProvider<DeletePostBloc>(create: (context) => DeletePostBloc()),
        BlocProvider<UpdatePostBloc>(create: (context) => UpdatePostBloc()),
        BlocProvider<SearchPostsBloc>(create: (context) => SearchPostsBloc()),
        BlocProvider<ChatListBloc>(
            create: ((context) => ChatListBloc()
              ..add(
                GetChatList(
                    currentUid: context.read<AppBloc>().appUserModel!.uid),
              ))),
        BlocProvider<IndividualMessageBloc>(
            create: (context) => IndividualMessageBloc()),
        BlocProvider<UpdateProfileBloc>(
            create: ((context) => UpdateProfileBloc())),
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
