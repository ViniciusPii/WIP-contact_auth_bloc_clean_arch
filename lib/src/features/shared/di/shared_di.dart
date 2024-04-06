import 'package:contact_auth_bloc/src/di/inject.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/get_user_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/impl/get_user_use_case_impl.dart';
import 'package:contact_auth_bloc/src/features/shared/data/data_sources/auth_data_source.dart';
import 'package:contact_auth_bloc/src/features/shared/data/data_sources/impl/auth_data_source_impl.dart';
import 'package:contact_auth_bloc/src/features/shared/data/data_sources/impl/user_data_source_impl.dart';
import 'package:contact_auth_bloc/src/features/shared/data/data_sources/user_data_source.dart';
import 'package:contact_auth_bloc/src/features/shared/data/repositories/auth_repository.dart';
import 'package:contact_auth_bloc/src/features/shared/data/repositories/impl/auth_repository_impl.dart';
import 'package:contact_auth_bloc/src/features/shared/data/repositories/impl/user_repository_impl.dart';
import 'package:contact_auth_bloc/src/features/shared/data/repositories/user_repository.dart';

class SharedDI {
  SharedDI._();

  static configure() {
    _configureDataSources();
    _configureRepositories();
    _configureUseCases();
    _configureCubits();
  }

  static void _configureDataSources() {
    getIt.registerLazySingleton<UserDataSource>(
      () => UserDataSourceImpl(
        firebaseAuth: getIt.get(),
      ),
    );
    getIt.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(
        firebaseAuth: getIt.get(),
        googleSignIn: getIt.get(),
      ),
    );
  }

  static void _configureRepositories() {
    getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        dataSource: getIt.get(),
      ),
    );
    getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        dataSource: getIt.get(),
      ),
    );
  }

  static void _configureUseCases() {
    getIt.registerLazySingleton<GetUserUseCase>(
      () => GetUserUseCaseImpl(
        repository: getIt.get(),
      ),
    );
  }

  static void _configureCubits() {}
}
