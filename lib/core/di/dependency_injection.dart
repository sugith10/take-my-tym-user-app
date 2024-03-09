import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/auth/data/datasources/remote_data_source.dart';
import 'package:take_my_tym/features/auth/data/repositories/signin_user_repo_impl.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signin_user_repo.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signin_usecases.dart';

final class DependencyInject{
  void setupDependencies(){
    log("its done");
    GetIt.instance.registerLazySingleton<SignInRepo>(
      () => SignInRepoImpl(RemoteDataSource()));

     GetIt.instance.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(GetIt.instance<SignInRepo>()));
  }

}