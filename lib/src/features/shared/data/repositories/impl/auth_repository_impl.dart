import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/features/shared/data/data_sources/auth_data_source.dart';
import 'package:contact_auth_bloc/src/features/shared/data/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthDataSource dataSource,
  }) : _dataSource = dataSource;

  final AuthDataSource _dataSource;

  @override
  Future<bool> signInWithGoogle() async {
    try {
      return await _dataSource.signInWithGoogle();
    } on AppNetworkMessageException catch (e) {
      throw AppNetworkMessageException(message: e.message);
    } on AppGenericMessageException catch (e) {
      throw AppGenericMessageException(message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return await _dataSource.signOut();
    } on AppGenericException catch (_) {
      throw AppGenericException();
    }
  }

  @override
  Stream<bool> isLoggedIn() {
    try {
      return _dataSource.isLoggedIn();
    } on AppGenericException catch (_) {
      throw AppGenericException();
    }
  }
}
