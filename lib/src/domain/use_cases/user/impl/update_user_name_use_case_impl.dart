import 'package:contact_auth_bloc/src/data/repositories/user/user_repository.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/update_user_name_use_case.dart';

class UpdateUserNameUseCaseImpl implements UpdateUserNameUseCase {
  UpdateUserNameUseCaseImpl({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  @override
  Future<void> call(String name) async => await _repository.updateUserName(name);
}
