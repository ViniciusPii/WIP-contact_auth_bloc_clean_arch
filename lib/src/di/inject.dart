import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_auth_bloc/src/data/data_sources/auth/auth_data_source.dart';
import 'package:contact_auth_bloc/src/data/data_sources/auth/impl/auth_data_source_impl.dart';
import 'package:contact_auth_bloc/src/data/data_sources/contacts/contacts_data_source.dart';
import 'package:contact_auth_bloc/src/data/data_sources/contacts/impl/contacts_data_source_impl.dart';
import 'package:contact_auth_bloc/src/data/data_sources/user/impl/user_data_source_impl.dart';
import 'package:contact_auth_bloc/src/data/data_sources/user/user_data_source.dart';
import 'package:contact_auth_bloc/src/data/repositories/auth/auth_repository.dart';
import 'package:contact_auth_bloc/src/data/repositories/auth/impl/auth_repository_impl.dart';
import 'package:contact_auth_bloc/src/data/repositories/contacts/contacts_repository.dart';
import 'package:contact_auth_bloc/src/data/repositories/contacts/impl/contacts_repository_impl.dart';
import 'package:contact_auth_bloc/src/data/repositories/user/impl/user_repository_impl.dart';
import 'package:contact_auth_bloc/src/data/repositories/user/user_repository.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/impl/is_logged_in_use_case_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/impl/sign_in_with_google_use_case_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/impl/sign_out_use_case_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/is_logged_in_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/sign_in_with_google_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/sign_out_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/contacts/add_contact_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/contacts/impl/add_contact_use_case_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/get_user_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/impl/get_user_use_case_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/impl/update_user_name_use_case_impl.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/update_user_name_use_case.dart';
import 'package:contact_auth_bloc/src/presentation/add_contact/controller/add_contact_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/authentication/controller/authentication_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/home/controller/home_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/login/controller/login_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/main/controller/main_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/profile/controller/profile_cubit.dart';
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
    getIt.registerLazySingleton(() => FirebaseAuth.instance);
    getIt.registerLazySingleton(() => FirebaseFirestore.instance);
    getIt.registerLazySingleton(() => GoogleSignIn());
  }

  static void _configureDataSources() {
    // Auth
    getIt.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(firebaseAuth: getIt.get(), googleSignIn: getIt.get()),
    );

    // User
    getIt.registerLazySingleton<UserDataSource>(
      () => UserDataSourceImpl(firebaseAuth: getIt.get()),
    );

    // Contacts
    getIt.registerLazySingleton<ContactsDataSource>(
      () => ContactsDataSourceImpl(firestore: getIt.get()),
    );
  }

  static void _configureRepositories() {
    // Auth
    getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(dataSource: getIt.get()),
    );

    // User
    getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(dataSource: getIt.get()),
    );

    // Contacts
    getIt.registerLazySingleton<ContactsRepository>(
      () => ContactsRepositoryImpl(dataSource: getIt.get()),
    );
  }

  static void _configureUseCases() {
    // Auth
    getIt.registerLazySingleton<SignInWithGoogleUseCase>(
      () => SignInWithGoogleUseCaseImpl(repository: getIt.get()),
    );
    getIt.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCaseImpl(repository: getIt.get()),
    );
    getIt.registerLazySingleton<IsLoggedInUseCase>(
      () => IsLoggedInUseCaseImpl(repository: getIt.get()),
    );

    // User
    getIt.registerLazySingleton<GetUserUseCase>(
      () => GetUserUseCaseImpl(repository: getIt.get()),
    );
    getIt.registerLazySingleton<UpdateUserNameUseCase>(
      () => UpdateUserNameUseCaseImpl(repository: getIt.get()),
    );

    // Contacts
    getIt.registerLazySingleton<AddContactUseCase>(
      () => AddContactUseCaseImpl(
        repository: getIt.get(),
        getUserUseCase: getIt.get(),
      ),
    );
  }

  static void _configureCubits() {
    // Auth
    getIt.registerFactory(() => WelcomeCubit());
    getIt.registerFactory(() => LoginCubit(signInWithGoogleUseCase: getIt.get()));
    getIt.registerFactory(() => AuthenticationCubit(isLoggedInUseCase: getIt.get()));

    // Main
    getIt.registerFactory(() => MainCubit());
    getIt.registerFactory(() => HomeCubit(getUserUseCase: getIt.get()));
    getIt.registerFactory(
      () => ProfileCubit(
        signOutUseCase: getIt.get(),
        getUserUseCase: getIt.get(),
        updateUserNameUseCase: getIt.get(),
      ),
    );

    // Contacts
    getIt.registerFactory(() => AddContactCubit(addContactUseCase: getIt.get()));
  }
}
