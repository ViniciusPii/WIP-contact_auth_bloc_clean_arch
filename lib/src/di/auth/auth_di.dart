import 'package:contact_auth_bloc/src/data/data_sources/auth/auth_data_source.dart';
import 'package:contact_auth_bloc/src/data/data_sources/auth/impl/auth_data_source_impl.dart';
import 'package:contact_auth_bloc/src/data/repositories/auth/auth_repository.dart';
import 'package:contact_auth_bloc/src/data/repositories/auth/impl/auth_repository_impl.dart';
import 'package:contact_auth_bloc/src/di/inject.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/impl/is_logged_in_use_case_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/impl/sign_in_with_google_use_case_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/impl/sign_out_use_case_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/is_logged_in_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/sign_in_with_google_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/sign_out_use_case.dart';

class AuthDI {
  AuthDI._();

  static configure() {
    _configureDataSources();
    _configureRepositories();
    _configureUseCases();
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
    getIt.registerLazySingleton<IsLoggedInUseCase>(
      () => IsLoggedInUseCaseImpl(
        repository: getIt.get(),
      ),
    );
    getIt.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCaseImpl(
        repository: getIt.get(),
      ),
    );
  }
}
