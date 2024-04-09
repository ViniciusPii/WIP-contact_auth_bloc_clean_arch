import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_auth_bloc/src/di/auth_di.dart';
import 'package:contact_auth_bloc/src/di/contact_di.dart';
import 'package:contact_auth_bloc/src/di/profile_di.dart';
import 'package:contact_auth_bloc/src/di/shared_di.dart';
import 'package:contact_auth_bloc/src/presentation/main/di/main_di.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final getIt = GetIt.instance;

class Inject {
  Inject._();

  static injection() {
    AuthDI.configure();
    MainDI.configure();
    SharedDI.configure();
    ProfileDI.configure();
    ContactDI.configure();
    _configureServices();
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
