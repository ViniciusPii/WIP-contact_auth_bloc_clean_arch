import 'package:contact_auth_bloc/src/di/inject.dart';
import 'package:contact_auth_bloc/src/features/auth/domain/use_cases/impl/is_logged_in_use_case_impl.dart';
import 'package:contact_auth_bloc/src/features/auth/domain/use_cases/impl/sign_in_with_google_use_case_impl.dart';
import 'package:contact_auth_bloc/src/features/auth/domain/use_cases/impl/sign_out_use_case_impl.dart';
import 'package:contact_auth_bloc/src/features/auth/domain/use_cases/is_logged_in_use_case.dart';
import 'package:contact_auth_bloc/src/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:contact_auth_bloc/src/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:contact_auth_bloc/src/features/auth/presentation/authentication/controller/authentication_cubit.dart';
import 'package:contact_auth_bloc/src/features/auth/presentation/login/controller/login_cubit.dart';
import 'package:contact_auth_bloc/src/features/auth/presentation/welcome/controller/welcome_cubit.dart';

class AuthDI {
  AuthDI._();

  static configure() {
    _configureDataSources();
    _configureRepositories();
    _configureUseCases();
    _configureCubits();
  }

  static void _configureDataSources() {}

  static void _configureRepositories() {}

  static void _configureUseCases() {
    getIt.registerLazySingleton<SignInWithGoogleUseCase>(
      () => SignInWithGoogleUseCaseImpl(repository: getIt.get()),
    );
    //TODO profile
    getIt.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCaseImpl(repository: getIt.get()),
    );
    getIt.registerLazySingleton<IsLoggedInUseCase>(
      () => IsLoggedInUseCaseImpl(repository: getIt.get()),
    );
  }

  static void _configureCubits() {
    getIt.registerFactory(() => WelcomeCubit());
    getIt.registerFactory(() => LoginCubit(signInWithGoogleUseCase: getIt.get()));
    getIt.registerFactory(() => AuthenticationCubit(isLoggedInUseCase: getIt.get()));
  }
}
