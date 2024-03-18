import 'package:contact_auth_bloc/firebase_options.dart';
import 'package:contact_auth_bloc/src/app.dart';
import 'package:contact_auth_bloc/src/di/inject.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Inject.injection();
  runApp(const App());
}
