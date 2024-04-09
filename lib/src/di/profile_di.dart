import 'package:contact_auth_bloc/src/di/inject.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/impl/sign_out_use_case_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/sign_out_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/impl/update_user_name_use_case_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/update_user_name_use_case.dart';
import 'package:contact_auth_bloc/src/presentation/profile/profile/controller/profile_cubit.dart';

class ProfileDI {
  ProfileDI._();

  static configure() {
    _configureUseCases();
    _configureCubits();
  }

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
