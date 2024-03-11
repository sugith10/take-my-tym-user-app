import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:take_my_tym/app.dart';
import 'package:take_my_tym/core/di/dependency_injection.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInject().setupDependencies();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
