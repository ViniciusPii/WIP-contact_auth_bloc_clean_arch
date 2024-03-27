import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/data/repositories/auth/auth_repository.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/sign_in_with_google_use_case.dart';

class SignInWithGoogleUseCaseImpl implements SignInWithGoogleUseCase {
  SignInWithGoogleUseCaseImpl({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  @override
  Future<bool> call() async {
    try {
      return await _repository.signInWithGoogle();
    } on AppNetworkMessageException catch (e) {
      throw AppNetworkMessageException(message: e.message);
    } on AppMessageException catch (e) {
      throw AppMessageException(message: e.message);
    }
  }
}
