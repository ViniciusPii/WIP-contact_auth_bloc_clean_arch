import 'package:contact_auth_bloc/src/data/repositories/auth/auth_repository.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/sign_out_use_case.dart';

class SignOutUseCaseImpl implements SignOutUseCase {
  SignOutUseCaseImpl({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  @override
  Future<void> call() async => await _repository.signOut();
}
