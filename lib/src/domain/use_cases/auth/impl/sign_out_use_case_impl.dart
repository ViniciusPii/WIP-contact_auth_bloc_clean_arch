import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/data/repositories/auth/auth_repository.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/sign_out_use_case.dart';

class SignOutUseCaseImpl implements SignOutUseCase {
  SignOutUseCaseImpl({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  @override
  Future<void> call() async {
    try {
      await _repository.signOut();
    } on DeprecatedAppGenericException catch (e) {
      throw DeprecatedAppGenericException(message: e.message);
    }
  }
}
