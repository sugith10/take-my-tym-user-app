import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/auth/data/datasources/remote/forget_password_remote_data.dart';
import 'package:take_my_tym/features/auth/data/datasources/remote/sign_in_remote_data.dart';
import 'package:take_my_tym/features/auth/data/datasources/remote/sign_out_remote_data.dart';
import 'package:take_my_tym/features/auth/data/datasources/remote/sign_up_remote_data.dart';
import 'package:take_my_tym/features/auth/data/datasources/remote/social_auth_remote_data.dart';
import 'package:take_my_tym/features/auth/data/repositories/forget_password_repo_impl.dart';
import 'package:take_my_tym/features/auth/data/repositories/signin_repo_impl.dart';
import 'package:take_my_tym/features/auth/data/repositories/signout_repo_impl.dart';
import 'package:take_my_tym/features/auth/data/repositories/signup_repo_impl.dart';
import 'package:take_my_tym/features/auth/data/repositories/social_auth_repo_impl.dart';
import 'package:take_my_tym/features/auth/domain/repositories/forget_password_repo.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signin_repo.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signout_repo.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signup_repo.dart';
import 'package:take_my_tym/features/auth/domain/repositories/social_auth_repo.dart';
import 'package:take_my_tym/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signin_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signout_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signup_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/social_auth_usecase.dart';
import 'package:take_my_tym/features/post/data/datasources/remote_data_source/create_remote_data_source.dart';
import 'package:take_my_tym/features/post/data/datasources/remote_data_source/delete_post_data_source.dart';
import 'package:take_my_tym/features/post/data/datasources/remote_data_source/get_user_posts_data_source.dart';
import 'package:take_my_tym/features/post/data/datasources/remote_data_source/search_posts_remote_data_source.dart';
import 'package:take_my_tym/features/post/data/datasources/remote_data_source/update_post_remote_data_source.dart';
import 'package:take_my_tym/features/post/data/repositories/create_post_repo_impl.dart';
import 'package:take_my_tym/features/post/data/repositories/delete_post_repo_impl.dart';
import 'package:take_my_tym/features/post/data/repositories/get_user_posts_repo_impl.dart';
import 'package:take_my_tym/features/post/data/repositories/search_posts_repo_impl.dart';
import 'package:take_my_tym/features/post/data/repositories/update_post_repo_impl.dart';
import 'package:take_my_tym/features/post/domain/repositories/create_post_repo.dart';
import 'package:take_my_tym/features/post/domain/repositories/delete_post_repo.dart';
import 'package:take_my_tym/features/post/domain/repositories/get_user_posts_repo.dart';
import 'package:take_my_tym/features/post/domain/repositories/search_posts_repo.dart';
import 'package:take_my_tym/features/post/domain/repositories/update_post_repo.dart';
import 'package:take_my_tym/features/post/domain/usecases/create_post_usecase.dart';
import 'package:take_my_tym/features/post/domain/usecases/delete_post_usecase.dart';
import 'package:take_my_tym/features/post/domain/usecases/get_user_posts_usecase.dart';
import 'package:take_my_tym/features/post/domain/usecases/search_posts_usecase.dart';
import 'package:take_my_tym/features/post/domain/usecases/update_post_usecase.dart';

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

    ///Delete
    GetIt.instance.registerLazySingleton<DeletePostRepo>(
        () => DeletePostRepoImp(DeletePostRemoteData()));
    GetIt.instance.registerLazySingleton<DeletePostUseCase>(
        () => DeletePostUseCase(GetIt.instance<DeletePostRepo>()));

    ///Update Post
    GetIt.instance.registerLazySingleton<UpdatePostRepo>(
        () => UpdatePostRepoImpl(UpdatePostRemoteData()));
    GetIt.instance.registerLazySingleton<UpdatePostUseCase>(
      () => UpdatePostUseCase(GetIt.instance<UpdatePostRepo>()));

    ///Search Posts
    GetIt.instance.registerLazySingleton<SearchPostRepo>(
      () => SearchPostsRepoImpl(SearchPostsRemoteData()));
    GetIt.instance.registerLazySingleton<SearchPostUseCase>(
      () => SearchPostUseCase(GetIt.instance<SearchPostRepo>()));
  }
}
