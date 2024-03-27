import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/data/repositories/auth/auth_repository.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/is_logged_in_use_case.dart';

class IsLoggedInUseCaseImpl implements IsLoggedInUseCase {
  IsLoggedInUseCaseImpl({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  @override
  Stream<bool> call() {
    try {
      return _repository.isLoggedIn();
    } on AppGenericException catch (_) {
      throw AppGenericException();
    }
  }
}
