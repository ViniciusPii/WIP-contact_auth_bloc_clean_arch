import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/data/repositories/user/user_repository.dart';
import 'package:contact_auth_bloc/src/domain/entities/user_entity.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/get_user_use_case.dart';

class GetUserUseCaseImpl implements GetUserUseCase {
  GetUserUseCaseImpl({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  @override
  UserEntity getUser() {
    try {
      return _repository.getUser();
    } on AppGenericException catch (e) {
      throw AppGenericException(message: e.message);
    }
  }
}
