import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_auth_bloc/src/di/auth/auth_di.dart';
import 'package:contact_auth_bloc/src/di/contact/contact_di.dart';
import 'package:contact_auth_bloc/src/di/controller/controller_di.dart';
import 'package:contact_auth_bloc/src/di/user/user_di.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final getIt = GetIt.instance;

class Inject {
  Inject._();

  static injection() {
    _configureServices();

    AuthDI.configure();
    UserDI.configure();
    ContactDI.configure();
    ControllerDI.configure();
  }

  static void _configureServices() {
    getIt.registerLazySingleton(
      () => FirebaseAuth.instance,
    );
    getIt.registerLazySingleton(
      () => FirebaseFirestore.instance,
    );
    getIt.registerLazySingleton(
      () => GoogleSignIn(),
    );
  }
}
