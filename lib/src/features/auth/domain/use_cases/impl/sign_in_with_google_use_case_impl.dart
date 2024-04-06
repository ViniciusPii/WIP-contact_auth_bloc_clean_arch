import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:contact_auth_bloc/src/features/shared/data/repositories/auth_repository.dart';

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
    } on AppGenericMessageException catch (e) {
      throw AppGenericMessageException(message: e.message);
    }
  }
}
