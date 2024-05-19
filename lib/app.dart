import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_view.dart';
import 'core/bloc/app_user_bloc/app_user_bloc.dart';
import 'features/auth/presentation/bloc/sign_out_bloc/sign_out_bloc.dart';
import 'features/contract/presentation/bloc/contracts_bloc/contracts_bloc.dart';
import 'features/home/presentation/bloc/community_posts_bloc/community_posts_bloc.dart';
import 'features/message/presentation/bloc/chat_list_bloc/chat_list_bloc.dart';
import 'features/proposal/presentation/bloc/get_offer_bloc/get_proposal_bloc.dart';
import 'features/view_post/presentation/bloc/read_post_bloc/read_post_bloc.dart';
import 'features/wallet/presentation/bloc/wallet_bloc/wallet_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppUserBloc>(
          create: (context) => AppUserBloc()..add(EnsureUserModelExistsEvent()),
        ),
        BlocProvider<GetPostsBloc>(
          create: (context) => GetPostsBloc()
            ..add(GetBuyTymPostsEvent(
                userId: context.read<AppUserBloc>().userModel!.uid)),
        ),
        BlocProvider<CommunityPostsBloc>(
          create: (context) => CommunityPostsBloc()
            ..add(BuyTymCommunityPostsEvent(
                userId: context.read<AppUserBloc>().userModel!.uid)),
        ),
        BlocProvider<ChatListBloc>(
          create: (context) => ChatListBloc()
            ..add(
              GetChatList(
                  currentUid: context.read<AppUserBloc>().userModel!.uid),
            ),
        ),
        BlocProvider<WalletBloc>(
          create: (context) => WalletBloc()
            ..add(
              WalletBalanceEvent(
                  uid: context.read<AppUserBloc>().userModel!.uid),
            ),
        ),
        BlocProvider<GetProposalBloc>(
          create: (context) => GetProposalBloc()
            ..add(
              ProposalGetEvent(uid: context.read<AppUserBloc>().userModel!.uid),
            ),
        ),
        BlocProvider<ContractsBloc>(create: (context) => ContractsBloc()),
        BlocProvider<SignOutBloc>(create: (context) => SignOutBloc()),
      ],
      child: const MyAppView(),
    );
  }
}
