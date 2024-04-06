import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/features/shared/data/repositories/user_repository.dart';
import 'package:contact_auth_bloc/src/features/shared/domain/entities/user_entity.dart';
import 'package:contact_auth_bloc/src/features/shared/domain/use_cases/get_user_use_case.dart';

class GetUserUseCaseImpl implements GetUserUseCase {
  GetUserUseCaseImpl({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  @override
  UserEntity call() {
    try {
      return _repository.getUser();
    } on AppGenericException catch (_) {
      throw AppGenericException();
    }
  }
}
