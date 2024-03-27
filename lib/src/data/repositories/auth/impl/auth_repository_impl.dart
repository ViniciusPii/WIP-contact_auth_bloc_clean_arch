import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/data/data_sources/auth/auth_data_source.dart';
import 'package:contact_auth_bloc/src/data/repositories/auth/auth_repository.dart';

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
    } on AppMessageException catch (e) {
      throw AppMessageException(message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return await _dataSource.signOut();
    } on DeprecatedAppGenericException catch (e) {
      throw DeprecatedAppGenericException(message: e.message);
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
