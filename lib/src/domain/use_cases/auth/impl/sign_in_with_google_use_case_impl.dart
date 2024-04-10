import 'package:contact_auth_bloc/src/data/repositories/auth/auth_repository.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/sign_in_with_google_use_case.dart';

class SignInWithGoogleUseCaseImpl implements SignInWithGoogleUseCase {
  SignInWithGoogleUseCaseImpl({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  @override
  Future<bool> call() async => await _repository.signInWithGoogle();
}
