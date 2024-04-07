import 'package:contact_auth_bloc/src/di/inject.dart';
import 'package:contact_auth_bloc/src/features/main/presentation/main/controller/main_cubit.dart';

class MainDI {
  MainDI._();

  static configure() {
    _configureCubits();
  }

  static void _configureCubits() {
    getIt.registerFactory(
      () => MainCubit(),
    );
  }
}
