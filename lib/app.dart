import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_view.dart';
import 'core/bloc/user_bloc/user_bloc.dart';
import 'features/contract/presentation/bloc/contracts_bloc/contracts_bloc.dart';
import 'features/home/presentation/bloc/community_posts_bloc/community_posts_bloc.dart';
import 'features/message/presentation/bloc/chat_list_bloc/chat_list_bloc.dart';
import 'features/proposal/presentation/bloc/get_offer_bloc/get_proposal_bloc.dart';
import 'features/view_post/presentation/bloc/read_post_bloc/read_post_bloc.dart';
import 'features/wallet/presentation/bloc/wallet_bloc/wallet_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyUserState();
}

class _MyUserState extends State<MyApp> {
  late UserBloc userBloc;
  GetProposalBloc? proposalBloc;
  WalletBloc? walletBloc;
  GetPostsBloc? postsBloc;
  CommunityPostsBloc? communityPostsBloc;
  ChatListBloc? chatListBloc;
  ContractsBloc? contractsBloc;

  @override
  void initState() {
    super.initState();
    userBloc = UserBloc()..add(UserCheckEvent());
    _setupUserBlocListener();
  }

  void _setupUserBlocListener() {
    userBloc.stream.listen((state) {
      if (state is UserUpdatedState) {
        _initializeDependentBlocs();
      } else if (state is UserLoggedOutState) {
        closeAllBlocs();
      }
    });
  }

  void _initializeDependentBlocs() {
    final uid = userBloc.userModel!.uid;
    proposalBloc = GetProposalBloc()..add(ProposalGetEvent(uid: uid));
    walletBloc = WalletBloc()..add(WalletBalanceEvent(uid: uid));
    postsBloc = GetPostsBloc()..add(GetBuyTymPostsEvent(userId: uid));
    communityPostsBloc = CommunityPostsBloc()
      ..add(BuyTymCommunityPostsEvent(userId: uid));
    chatListBloc = ChatListBloc()..add(GetChatList(currentUid: uid));
    contractsBloc = ContractsBloc();
    if (mounted) setState(() {});
  }

  void closeAllBlocs() {
    proposalBloc?.close();
    walletBloc?.close();
    postsBloc?.close();
    communityPostsBloc?.close();
    chatListBloc?.close();
    contractsBloc?.close();

    // Reset all blocs to null after closing
    proposalBloc = null;
    walletBloc = null;
    postsBloc = null;
    communityPostsBloc = null;
    chatListBloc = null;
    contractsBloc = null;

    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    closeAllBlocs();
    userBloc.close();
    super.dispose();
  }

  List<BlocProvider> _buildBlocProviders() {
    final providers = <BlocProvider>[
      BlocProvider<UserBloc>.value(value: userBloc),
    ];

    // Only add other BlocProviders if they're initialized
    if (proposalBloc != null) {
      providers.add(BlocProvider<GetProposalBloc>.value(value: proposalBloc!));
    }
    if (walletBloc != null) {
      providers.add(BlocProvider<WalletBloc>.value(value: walletBloc!));
    }
    if (postsBloc != null) {
      providers.add(BlocProvider<GetPostsBloc>.value(value: postsBloc!));
    }
    if (communityPostsBloc != null) {
      providers.add(
          BlocProvider<CommunityPostsBloc>.value(value: communityPostsBloc!));
    }
    if (chatListBloc != null) {
      providers.add(BlocProvider<ChatListBloc>.value(value: chatListBloc!));
    }
    if (contractsBloc != null) {
      providers.add(BlocProvider<ContractsBloc>.value(value: contractsBloc!));
    }

    return providers;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _buildBlocProviders(),
      child: const MyAppView(),
    );
  }
}
