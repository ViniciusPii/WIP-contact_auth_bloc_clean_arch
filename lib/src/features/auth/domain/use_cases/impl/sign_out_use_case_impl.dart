import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/features/auth/data/repositories/auth_repository.dart';
import 'package:contact_auth_bloc/src/features/auth/domain/use_cases/sign_out_use_case.dart';

class SignOutUseCaseImpl implements SignOutUseCase {
  SignOutUseCaseImpl({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  @override
  Future<void> call() async {
    try {
      await _repository.signOut();
    } on AppGenericException catch (_) {
      throw AppGenericException();
    }
  }
}
