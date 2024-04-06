import 'package:contact_auth_bloc/src/di/inject.dart';
import 'package:contact_auth_bloc/src/features/profile/domain/use_cases/impl/sign_out_use_case_impl.dart';
import 'package:contact_auth_bloc/src/features/profile/domain/use_cases/impl/update_user_name_use_case_impl.dart';
import 'package:contact_auth_bloc/src/features/profile/domain/use_cases/sign_out_use_case.dart';
import 'package:contact_auth_bloc/src/features/profile/domain/use_cases/update_user_name_use_case.dart';
import 'package:contact_auth_bloc/src/features/profile/presentation/profile/controller/profile_cubit.dart';

class ProfileDI {
  ProfileDI._();

  static configure() {
    _configureDataSources();
    _configureRepositories();
    _configureUseCases();
    _configureCubits();
  }

  static void _configureDataSources() {}

  static void _configureRepositories() {}

  static void _configureUseCases() {
    getIt.registerLazySingleton<UpdateUserNameUseCase>(
      () => UpdateUserNameUseCaseImpl(
        repository: getIt.get(),
      ),
    );
    getIt.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCaseImpl(
        repository: getIt.get(),
      ),
    );
  }

  static void _configureCubits() {
    getIt.registerFactory(
      () => ProfileCubit(
        signOutUseCase: getIt.get(),
        getUserUseCase: getIt.get(),
        updateUserNameUseCase: getIt.get(),
      ),
    );
  }
}
