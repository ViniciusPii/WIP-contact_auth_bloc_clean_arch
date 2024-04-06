import 'package:contact_auth_bloc/src/di/inject.dart';
import 'package:contact_auth_bloc/src/features/contact/data/data_sources/contacts_data_source.dart';
import 'package:contact_auth_bloc/src/features/contact/data/data_sources/impl/contacts_data_source_impl.dart';
import 'package:contact_auth_bloc/src/features/contact/data/repositories/contacts_repository.dart';
import 'package:contact_auth_bloc/src/features/contact/data/repositories/impl/contacts_repository_impl.dart';
import 'package:contact_auth_bloc/src/features/contact/domain/use_cases/add_contact_use_case.dart';
import 'package:contact_auth_bloc/src/features/contact/domain/use_cases/delete_contact_use_case.dart';
import 'package:contact_auth_bloc/src/features/contact/domain/use_cases/get_contacts_use_case.dart';
import 'package:contact_auth_bloc/src/features/contact/domain/use_cases/impl/add_contact_use_case_impl.dart';
import 'package:contact_auth_bloc/src/features/contact/domain/use_cases/impl/delete_contact_use_case_impl.dart';
import 'package:contact_auth_bloc/src/features/contact/domain/use_cases/impl/get_contacts_use_case_impl.dart';
import 'package:contact_auth_bloc/src/features/contact/presentation/add_contact/controller/add_contact_cubit.dart';
import 'package:contact_auth_bloc/src/features/contact/presentation/home/controller/home_cubit.dart';
import 'package:contact_auth_bloc/src/features/contact/presentation/main/controller/main_cubit.dart';

class ContactDI {
  ContactDI._();

  static configure() {
    _configureDataSources();
    _configureRepositories();
    _configureUseCases();
    _configureCubits();
  }

  static void _configureDataSources() {
    getIt.registerLazySingleton<ContactsDataSource>(
      () => ContactsDataSourceImpl(
        firestore: getIt.get(),
      ),
    );
  }

  static void _configureRepositories() {
    getIt.registerLazySingleton<ContactsRepository>(
      () => ContactsRepositoryImpl(
        dataSource: getIt.get(),
      ),
    );
  }

  static void _configureUseCases() {
    getIt.registerLazySingleton<AddContactUseCase>(
      () => AddContactUseCaseImpl(
        repository: getIt.get(),
        getUserUseCase: getIt.get(),
      ),
    );
    getIt.registerLazySingleton<GetContactsUseCase>(
      () => GetContactsUseCaseImpl(
        repository: getIt.get(),
        getUserUseCase: getIt.get(),
      ),
    );
    getIt.registerLazySingleton<DeleteContactUseCase>(
      () => DeleteContactUseCaseImpl(
        repository: getIt.get(),
        getUserUseCase: getIt.get(),
      ),
    );
  }

  static void _configureCubits() {
    getIt.registerFactory(
      () => MainCubit(),
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
  }
}
