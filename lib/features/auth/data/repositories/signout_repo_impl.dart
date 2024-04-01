import 'package:take_my_tym/features/auth/data/datasources/remote/sign_out_remote_data.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signout_repo.dart';

class SignOutRepoImp implements SignOutRepo{
  final SignOutRemoteData _remoteDataSource;
  SignOutRepoImp(this._remoteDataSource);
  @override
  Future<void> signOut() async {
    await  _remoteDataSource.signOut();
  }
  
}