import 'dart:developer';

import 'package:take_my_tym/core/utils/my_app_exception.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RemoteDataSource {
  Future<AuthUserModel> authenticateUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return AuthUserModel(email: credential.user?.email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
       throw const MyAppException(
        title: 'user-not-found',
        message: 'Check RemoteDataSource'
      );
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
         throw const MyAppException(
        title: 'wrong-password',
        message: 'Check RemoteDataSource'
      );
      }else{
        log('excpetion occured');
        log(e.toString());
         throw const MyAppException(
        title: 'check firebase exception',
        message: 'Check RemoteDataSource'
      );
      }
    }on Exception catch(e){
      log(e.toString());
      throw const MyAppException(
        title: 'Something went wrong',
        message: 'Check RemoteDataSource'
      );
    }
  }
}
