import 'package:contact_auth_bloc/src/di/inject.dart';
import 'package:contact_auth_bloc/src/presentation/auth/authentication/controller/authentication_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/auth/login/controller/login_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/auth/welcome/controller/welcome_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/contact/add_contact/controller/add_contact_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/contact/home/controller/home_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/main/controller/main_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/profile/profile/controller/profile_cubit.dart';

class ControllerDI {
  ControllerDI._();

  static configure() {
    _configureCubits();
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
    getIt.registerFactory(
      () => AuthenticationCubit(
        isLoggedInUseCase: getIt.get(),
      ),
    );
    getIt.registerFactory(
      () => HomeCubit(
        getUserUseCase: getIt.get(),
        getContactsUseCase: getIt.get(),
        deleteContactUseCase: getIt.get(),
      ),
    );
    getIt.registerFactory(
      () => AddContactCubit(
        addContactUseCase: getIt.get(),
      ),
    );
    getIt.registerFactory(
      () => ProfileCubit(
        signOutUseCase: getIt.get(),
        getUserUseCase: getIt.get(),
        updateUserNameUseCase: getIt.get(),
      ),
    );
    getIt.registerFactory(
      () => MainCubit(),
    );
  }
}
