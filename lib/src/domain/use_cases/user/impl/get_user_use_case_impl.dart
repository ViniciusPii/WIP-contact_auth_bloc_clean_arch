import 'package:contact_auth_bloc/src/data/repositories/user/user_repository.dart';
import 'package:contact_auth_bloc/src/domain/entities/user/user_entity.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/get_user_use_case.dart';

class GetUserUseCaseImpl implements GetUserUseCase {
  GetUserUseCaseImpl({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  @override
  UserEntity call() => _repository.getUser();
}
