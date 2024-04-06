import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_auth_bloc/src/features/auth/di/auth_di.dart';
import 'package:contact_auth_bloc/src/features/contact/di/contact_di.dart';
import 'package:contact_auth_bloc/src/features/profile/di/profile_di.dart';
import 'package:contact_auth_bloc/src/features/shared/di/shared_di.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final getIt = GetIt.instance;

class Inject {
  Inject._();

  static injection() {
    AuthDI.configure();
    SharedDI.configure();
    ProfileDI.configure();
    ContactDI.configure();
    _configureServices();
    _configureDataSources();
    _configureRepositories();
    _configureUseCases();
    _configureCubits();
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

  static void _configureDataSources() {}

  static void _configureRepositories() {}

  static void _configureUseCases() {}

  static void _configureCubits() {}
}
