import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/auth/data/datasources/local/local_data_source.dart';
import 'package:take_my_tym/features/auth/data/datasources/remote/forget_password_remote_data.dart';
import 'package:take_my_tym/features/auth/data/datasources/remote/sign_in_remote_data.dart';
import 'package:take_my_tym/features/auth/data/datasources/remote/sign_out_remote_data.dart';
import 'package:take_my_tym/features/auth/data/datasources/remote/sign_up_remote_data.dart';
import 'package:take_my_tym/features/auth/data/datasources/remote/social_auth_remote_data.dart';
import 'package:take_my_tym/features/auth/data/repositories/forget_password_repo_impl.dart';
import 'package:take_my_tym/features/auth/data/repositories/local_user_storage_repo_impl.dart';
import 'package:take_my_tym/features/auth/data/repositories/signin_repo_impl.dart';
import 'package:take_my_tym/features/auth/data/repositories/signout_repo_impl.dart';
import 'package:take_my_tym/features/auth/data/repositories/signup_repo_impl.dart';
import 'package:take_my_tym/features/auth/data/repositories/social_auth_repo_impl.dart';
import 'package:take_my_tym/features/auth/domain/repositories/forget_password_repo.dart';
import 'package:take_my_tym/features/auth/domain/repositories/local_user_storage_repo.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signin_repo.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signout_repo.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signup_repo.dart';
import 'package:take_my_tym/features/auth/domain/repositories/social_auth_repo.dart';
import 'package:take_my_tym/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/local_user_storage_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signin_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signout_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signup_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/social_auth_usecase.dart';
import 'package:take_my_tym/features/location/data/datasources/location_position_name_remote.dart';
import 'package:take_my_tym/features/location/data/datasources/location_position_remote.dart';
import 'package:take_my_tym/features/location/data/datasources/search_location_remote.dart';
import 'package:take_my_tym/features/location/data/repositories/current_location_repo_impl.dart';
import 'package:take_my_tym/features/location/data/repositories/location_position_repo.dart';
import 'package:take_my_tym/features/location/data/repositories/search_location_repo_impl.dart';
import 'package:take_my_tym/features/location/domain/repositories/current_location_repo.dart';
import 'package:take_my_tym/features/location/domain/repositories/location_position_repo.dart';
import 'package:take_my_tym/features/location/domain/repositories/search_location_repo.dart';
import 'package:take_my_tym/features/location/domain/usecases/current_location_use_case.dart';
import 'package:take_my_tym/features/location/domain/usecases/location_position_use_case.dart';
import 'package:take_my_tym/features/location/domain/usecases/search_location_use_case.dart';
import 'package:take_my_tym/features/message/data/datasources/remote/chat_service.dart';
import 'package:take_my_tym/features/message/data/repositories/chat_list_repo_impl.dart';
import 'package:take_my_tym/features/message/data/repositories/individual_message_repo_impl.dart';
import 'package:take_my_tym/features/message/domain/repositories/chat_list_repo.dart';
import 'package:take_my_tym/features/message/domain/repositories/individual_message_repo.dart';
import 'package:take_my_tym/features/message/domain/usecases/chat_list_usecase.dart';
import 'package:take_my_tym/features/message/domain/usecases/individual_message_usecase.dart';
import 'package:take_my_tym/features/post/data/datasources/remote_data_source/create_remote_data_source.dart';
import 'package:take_my_tym/features/post/data/datasources/remote_data_source/delete_post_data_source.dart';
import 'package:take_my_tym/features/post/data/datasources/remote_data_source/get_user_posts_data_source.dart';
import 'package:take_my_tym/features/search/data/datasources/remote/search_posts_remote_data_source.dart';
import 'package:take_my_tym/features/post/data/datasources/remote_data_source/update_post_remote_data_source.dart';
import 'package:take_my_tym/features/post/data/repositories/create_post_repo_impl.dart';
import 'package:take_my_tym/features/post/data/repositories/delete_post_repo_impl.dart';
import 'package:take_my_tym/features/post/data/repositories/get_user_posts_repo_impl.dart';
import 'package:take_my_tym/features/search/data/repositories/search_posts_repo_impl.dart';
import 'package:take_my_tym/features/post/data/repositories/update_post_repo_impl.dart';
import 'package:take_my_tym/features/post/domain/repositories/create_post_repo.dart';
import 'package:take_my_tym/features/post/domain/repositories/delete_post_repo.dart';
import 'package:take_my_tym/features/post/domain/repositories/get_user_posts_repo.dart';
import 'package:take_my_tym/features/search/domain/repositories/search_posts_repo.dart';
import 'package:take_my_tym/features/post/domain/repositories/update_post_repo.dart';
import 'package:take_my_tym/features/post/domain/usecases/create_post_usecase.dart';
import 'package:take_my_tym/features/post/domain/usecases/delete_post_usecase.dart';
import 'package:take_my_tym/features/post/domain/usecases/get_user_posts_usecase.dart';
import 'package:take_my_tym/features/search/domain/usecases/search_posts_usecase.dart';
import 'package:take_my_tym/features/post/domain/usecases/update_post_usecase.dart';
import 'package:take_my_tym/features/home/data/datasources/remote/community_posts_remote_data.dart';
import 'package:take_my_tym/features/home/data/repositories/community_posts_repo_impl.dart';
import 'package:take_my_tym/features/home/domain/repositories/community_posts_repo.dart';
import 'package:take_my_tym/features/home/domain/usecases/get_community_posts_usecase.dart';

final class DependencyInject {
  void setupDependencies() {
    ///SignIn
    GetIt.instance.registerLazySingleton<SignInRepo>(
        () => SignInRepoImpl(SignInRemoteData()));
    GetIt.instance.registerLazySingleton<SignInUseCase>(
        () => SignInUseCase(GetIt.instance<SignInRepo>()));

    ///SignUp
    GetIt.instance.registerLazySingleton<SignUpRepo>(
        () => SignUpRepoImpl(SignUpRemoteData()));
    GetIt.instance.registerLazySingleton<SignUpUseCase>(
        () => SignUpUseCase(GetIt.instance<SignUpRepo>()));

    ///SoialAuth
    GetIt.instance.registerLazySingleton<SocialAuthRepo>(
        () => SocialAuthRepoImpl(SocailAuthRemoteData()));
    GetIt.instance.registerLazySingleton<SocialAuthUseCase>(
        () => SocialAuthUseCase(GetIt.instance<SocialAuthRepo>()));

    ///SignOut
    GetIt.instance.registerLazySingleton<SignOutRepo>(
        () => SignOutRepoImp(SignOutRemoteData()));
    GetIt.instance.registerLazySingleton<SignOutUseCase>(
        () => SignOutUseCase(GetIt.instance<SignOutRepo>()));

    ///StoreLocalUserData
    GetIt.instance.registerLazySingleton<LocalUserDataRepo>(
        () => LocalUserDataRepoImpl(LocalUserData()));
    GetIt.instance.registerLazySingleton<LocalUserStorageUseCase>(
        () => LocalUserStorageUseCase(GetIt.instance<LocalUserDataRepo>()));

    ///CreatePost
    GetIt.instance.registerLazySingleton<CreatePostRepo>(
        () => CreatePostRepoImpl(CreatePostRemoteData()));
    GetIt.instance.registerLazySingleton<CreatePostUseCase>(
        () => CreatePostUseCase(GetIt.instance<CreatePostRepo>()));

    ///ForgetPassword
    GetIt.instance.registerLazySingleton<ForgetPasswordRepo>(
        () => ForgetPasswordRepoImpl(ForgetPasswordRemoteData()));
    GetIt.instance.registerLazySingleton<ForgetPasswordUseCase>(
        () => ForgetPasswordUseCase(GetIt.instance<ForgetPasswordRepo>()));

    ///UserBuyTymPosts
    GetIt.instance.registerLazySingleton<GetUserPostsRepo>(
        () => GetUserPostsRepoImp(GetUserPostsRemoteData()));
    GetIt.instance.registerLazySingleton<GetUserPostsUseCase>(
        () => GetUserPostsUseCase(GetIt.instance<GetUserPostsRepo>()));

    ///DeletePost
    GetIt.instance.registerLazySingleton<DeletePostRepo>(
        () => DeletePostRepoImp(DeletePostRemoteData()));
    GetIt.instance.registerLazySingleton<DeletePostUseCase>(
        () => DeletePostUseCase(GetIt.instance<DeletePostRepo>()));

    ///UpdatePost
    GetIt.instance.registerLazySingleton<UpdatePostRepo>(
        () => UpdatePostRepoImpl(UpdatePostRemoteData()));
    GetIt.instance.registerLazySingleton<UpdatePostUseCase>(
        () => UpdatePostUseCase(GetIt.instance<UpdatePostRepo>()));

    ///SearchPosts
    GetIt.instance.registerLazySingleton<SearchPostRepo>(
        () => SearchPostsRepoImpl(SearchPostsRemoteData()));
    GetIt.instance.registerLazySingleton<SearchPostUseCase>(
        () => SearchPostUseCase(GetIt.instance<SearchPostRepo>()));

    ///CommunityPosts
    GetIt.instance.registerLazySingleton<CommunityPostsRepo>(
        () => CommunityPostsRepoImpl(CommunityPostsRemoteData()));
    GetIt.instance.registerLazySingleton<CommunityPostsUseCase>(
        () => CommunityPostsUseCase(GetIt.instance<CommunityPostsRepo>()));

    ///IndividualMessage
    GetIt.instance.registerLazySingleton<IndividualMessageRepo>(
        () => IndividualMessageRepoImpl(MessageRemoteData()));
    GetIt.instance.registerLazySingleton<IndividualMessageUseCase>(() =>
        IndividualMessageUseCase(GetIt.instance<IndividualMessageRepo>()));

    ///ChatList
    GetIt.instance.registerLazySingleton<ChatListRepo>(
        () => ChatListRepoImp(MessageRemoteData()));
    GetIt.instance.registerLazySingleton<ChatListUseCase>(
        () => ChatListUseCase(GetIt.instance<ChatListRepo>()));

    ///SearchLocation
    GetIt.instance.registerLazySingleton<SearchLocationRepo>(
        () => SearchLocationRepoImpl(SerachLocationRemote()));
    GetIt.instance.registerLazySingleton<SearchLocationUseCase>(
        () => SearchLocationUseCase(GetIt.instance<SearchLocationRepo>()));

    ///GetPositonOfLocation
    GetIt.instance.registerLazySingleton<LocationPositionRepo>(
        () => LocationPositionRepoImpl(LocationPositionRemote()));
    GetIt.instance.registerLazySingleton<LocationPositionUseCase>(
        () => LocationPositionUseCase(GetIt.instance<LocationPositionRepo>()));
  
    ///GetLocationPositionName
    GetIt.instance.registerLazySingleton<CurrentLocationRepo>(
      () => CurrentLocationRepoImpl(CurrentLocationRemote()));
    GetIt.instance.registerLazySingleton<CurrentLocationUseCase>(
      () => CurrentLocationUseCase(GetIt.instance<CurrentLocationRepo>()));
      
  }
}
