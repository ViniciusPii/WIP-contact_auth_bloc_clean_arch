import 'package:contact_auth_bloc/src/data/data_sources/user/impl/user_data_source_impl.dart';
import 'package:contact_auth_bloc/src/data/data_sources/user/user_data_source.dart';
import 'package:contact_auth_bloc/src/data/repositories/user/impl/user_repository_impl.dart';
import 'package:contact_auth_bloc/src/data/repositories/user/user_repository.dart';
import 'package:contact_auth_bloc/src/di/inject.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/get_user_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/impl/get_user_use_case_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/impl/update_user_name_use_case_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/update_user_name_use_case.dart';

class UserDI {
  UserDI._();

  static configure() {
    _configureDataSources();
    _configureRepositories();
    _configureUseCases();
  }

  static void _configureDataSources() {
    getIt.registerLazySingleton<UserDataSource>(
      () => UserDataSourceImpl(
        firebaseAuth: getIt.get(),
      ),
    );
  }

  static void _configureRepositories() {
    getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
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
    getIt.registerLazySingleton<UpdateUserNameUseCase>(
      () => UpdateUserNameUseCaseImpl(
        repository: getIt.get(),
      ),
    );
  }
}
