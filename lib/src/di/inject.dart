import 'package:contact_auth_bloc/src/presentation/welcome/controller/welcome_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class Inject {
  static injection() {
    _configureServices();
    _configureDataSources();
    _configureRepositories();
    _configureUseCases();
    _configureCubits();
  }

  static void _configureServices() {}

  static void _configureDataSources() {}

  static void _configureRepositories() {}

  static void _configureUseCases() {}

  static void _configureCubits() {
    getIt.registerFactory(
      () => WelcomeCubit(),
    );
  }
}
