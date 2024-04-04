import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/features/auth/data/repositories/auth_repository.dart';
import 'package:contact_auth_bloc/src/features/auth/domain/use_cases/is_logged_in_use_case.dart';

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
