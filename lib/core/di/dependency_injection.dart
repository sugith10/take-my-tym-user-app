part of 'dependency_injection_packages.dart';

final class DependencyInject {
  final _getIt = GetIt.instance;
  void setupDependencies() {
    ///SignIn
    _getIt
      ..registerLazySingleton<SignInRepo>(
          () => SignInRepoImpl(SignInRemoteData()))
      ..registerLazySingleton<SignInUseCase>(
          () => SignInUseCase(_getIt<SignInRepo>()));

    ///SignUp
    _getIt
      ..registerLazySingleton<SignUpRepo>(
          () => SignUpRepoImpl(SignUpRemoteData()))
      ..registerLazySingleton<SignUpUseCase>(
          () => SignUpUseCase(_getIt<SignUpRepo>()));

    ///SoialAuth
    _getIt
      ..registerLazySingleton<SocialAuthRepo>(
          () => SocialAuthRepoImpl(SocailAuthRemoteData()))
      ..registerLazySingleton<SocialAuthUseCase>(
          () => SocialAuthUseCase(_getIt<SocialAuthRepo>()));

    ///SignOut
    _getIt
      ..registerLazySingleton<SignOutRepo>(
          () => SignOutRepoImp(SignOutRemoteData()))
      ..registerLazySingleton<SignOutUseCase>(
          () => SignOutUseCase(_getIt<SignOutRepo>()));

    ///StoreLocalUserData
    _getIt
      ..registerLazySingleton<LocalUserDataRepo>(
          () => LocalUserDataRepoImpl(LocalUserData()))
      ..registerLazySingleton<LocalUserStorageUseCase>(
          () => LocalUserStorageUseCase(_getIt<LocalUserDataRepo>()));

    ///CreatePost
    _getIt
      ..registerLazySingleton<CreatePostRepo>(
          () => CreatePostRepoImpl(CreatePostRemoteData()))
      ..registerLazySingleton<CreatePostUseCase>(
          () => CreatePostUseCase(_getIt<CreatePostRepo>()));

    ///ForgetPassword
    _getIt
      ..registerLazySingleton<ForgetPasswordRepo>(
          () => ForgetPasswordRepoImpl(ForgetPasswordRemoteData()))
      ..registerLazySingleton<ForgetPasswordUseCase>(
          () => ForgetPasswordUseCase(_getIt<ForgetPasswordRepo>()));

    ///UserBuyTymPosts
    _getIt
      ..registerLazySingleton<GetUserPostsRepo>(
          () => GetUserPostsRepoImp(GetUserPostsRemoteData()))
      ..registerLazySingleton<GetUserPostsUseCase>(
          () => GetUserPostsUseCase(_getIt<GetUserPostsRepo>()));

    ///DeletePost
    _getIt
      ..registerFactory<DeletePostRepo>(
          () => DeletePostRepoImp(DeletePostRemoteData()))
      ..registerFactory<DeletePostUseCase>(
          () => DeletePostUseCase(_getIt<DeletePostRepo>()));

    ///UpdatePost
    _getIt
      ..registerFactory<UpdatePostRepo>(
          () => UpdatePostRepoImpl(UpdatePostRemoteData()))
      ..registerFactory<UpdatePostUseCase>(
          () => UpdatePostUseCase(_getIt<UpdatePostRepo>()));

    ///SearchPosts
    _getIt
      ..registerFactory<SearchPostRepo>(
          () => SearchPostsRepoImpl(SearchPostsRemoteData()))
      ..registerFactory<SearchPostUseCase>(
          () => SearchPostUseCase(_getIt<SearchPostRepo>()));

    ///CommunityPosts
    _getIt
      ..registerLazySingleton<CommunityPostsRepo>(
          () => CommunityPostsRepoImpl(CommunityPostsRemoteData()))
      ..registerLazySingleton<CommunityPostsUseCase>(
          () => CommunityPostsUseCase(_getIt<CommunityPostsRepo>()))
      ..registerLazySingleton<NearbyPostsUseCase>(
          () => NearbyPostsUseCase(_getIt<CommunityPostsRepo>()));

    ///NearbyPostsBloc Bloc
    _getIt.registerLazySingleton<NearbyPostsBloc>(
      () => NearbyPostsBloc(
        newPostsUseCase: _getIt<NearbyPostsUseCase>(),
      ),
    );

    ///IndividualMessage
    _getIt
      ..registerLazySingleton<IndividualMessageRepo>(
          () => IndividualMessageRepoImpl(MessageRemoteData()))
      ..registerLazySingleton<IndividualMessageUseCase>(
          () => IndividualMessageUseCase(_getIt<IndividualMessageRepo>()));

    ///ChatList
    _getIt
      ..registerLazySingleton<ChatListRepo>(
          () => ChatListRepoImp(MessageRemoteData()))
      ..registerLazySingleton<ChatListUseCase>(
          () => ChatListUseCase(_getIt<ChatListRepo>()));

    ///SearchLocation
    _getIt
      ..registerFactory<SearchLocationRepo>(
          () => SearchLocationRepoImpl(SerachLocationRemote()))
      ..registerFactory<SearchLocationUseCase>(
          () => SearchLocationUseCase(_getIt<SearchLocationRepo>()));

    ///GetPositonOfLocation
    _getIt
      ..registerLazySingleton<LocationPositionRepo>(
          () => LocationPositionRepoImpl(LocationPositionRemote()))
      ..registerLazySingleton<LocationPositionUseCase>(
          () => LocationPositionUseCase(_getIt<LocationPositionRepo>()));

    ///GetLocationPositionName
    _getIt
      ..registerLazySingleton<CurrentLocationRepo>(
          () => CurrentLocationRepoImpl(CurrentLocationRemote()))
      ..registerLazySingleton<CurrentLocationUseCase>(
          () => CurrentLocationUseCase(_getIt<CurrentLocationRepo>()));

    ///VerifyUser
    _getIt
      ..registerLazySingleton<VerifyUserRepo>(
          () => VerifyUserRepoImpl(VerifyUserRemote()))
      ..registerLazySingleton<VerifyUserUseCase>(
          () => VerifyUserUseCase(_getIt<VerifyUserRepo>()));

    ///UpdateProfile
    _getIt
      ..registerLazySingleton<UpdateProfileRepo>(
          () => UpdateProfileRepoImpl(UpdateProfileRemote()))
      ..registerLazySingleton<UpdateProfileUseCase>(
          () => UpdateProfileUseCase(_getIt<UpdateProfileRepo>()));

    ///Wallet
    _getIt
      ..registerLazySingleton<WalletRepo>(
          () => WalletRepoImpl(WalletRemoteData()))
      ..registerLazySingleton<WalletUseCase>(
          () => WalletUseCase(_getIt<WalletRepo>()));
  }
}
