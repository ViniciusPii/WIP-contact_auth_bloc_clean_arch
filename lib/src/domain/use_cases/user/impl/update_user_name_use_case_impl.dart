import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/update_user_name_use_case.dart';
import 'package:contact_auth_bloc/src/features/shared/data/repositories/user_repository.dart';

class UpdateUserNameUseCaseImpl implements UpdateUserNameUseCase {
  UpdateUserNameUseCaseImpl({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  @override
  Future<void> call(String name) async {
    try {
      return await _repository.updateUserName(name);
    } on DeprecatedAppGenericException catch (e) {
      throw DeprecatedAppGenericException(message: e.message);
    }
  }
}
