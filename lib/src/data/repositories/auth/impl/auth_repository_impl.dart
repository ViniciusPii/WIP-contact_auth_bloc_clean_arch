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
    } on AppGenericException catch (e) {
      throw AppGenericException(message: e.message);
    }
  }
}
