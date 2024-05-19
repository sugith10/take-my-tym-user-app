import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:take_my_tym/app.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/di/dependency_injection_packages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInject().setupDependencies();

  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    dotenv.load(fileName: ".env"),
  ]);

  Stripe.publishableKey = dotenv.env["STRIPE_PUBLISH_KEY"]!;
  Stripe.instance.applySettings();

  final Directory appDocumentDirectory =
      await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}
