import 'package:take_my_tym/features/auth/data/models/auth_user.dart';

class RemoteDataSource{
  Future<AuthUserModel> authenticateUser(String email, String password)async{
      final Map<String, dynamic> userJson = {
      "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9",
      "expiresIn": 3600,
      "userId": "123456",
      "email": "user@example.com"
    };
    return AuthUserModel.fromMap(userJson);
  }
}