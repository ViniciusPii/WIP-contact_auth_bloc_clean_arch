import 'package:contact_auth_bloc/src/data/data_sources/auth/auth_data_source.dart';
import 'package:contact_auth_bloc/src/data/data_sources/auth/impl/auth_data_source_impl.dart';
import 'package:contact_auth_bloc/src/data/repositories/auth/auth_repository.dart';
import 'package:contact_auth_bloc/src/data/repositories/auth/impl/auth_repository_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/impl/sign_in_with_google_use_case_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/sign_in_with_google_use_case.dart';
import 'package:contact_auth_bloc/src/presentation/login/controller/login_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/welcome/controller/welcome_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final getIt = GetIt.instance;

class Inject {
  Inject._();

  static injection() {
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
      () => GoogleSignIn(),
    );
  }

  static void _configureDataSources() {
    getIt.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(
        firebaseAuth: getIt.get(),
        googleSignIn: getIt.get(),
      ),
    );
  }

  static void _configureRepositories() {
    getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        dataSource: getIt.get(),
      ),
    );
  }

  static void _configureUseCases() {
    getIt.registerLazySingleton<SignInWithGoogleUseCase>(
      () => SignInWithGoogleUseCaseImpl(
        repository: getIt.get(),
      ),
    );
  }

  static void _configureCubits() {
    getIt.registerFactory(
      () => WelcomeCubit(),
    );
    getIt.registerFactory(
      () => LoginCubit(
        signInWithGoogleUseCase: getIt.get(),
      ),
    );
  }
}
