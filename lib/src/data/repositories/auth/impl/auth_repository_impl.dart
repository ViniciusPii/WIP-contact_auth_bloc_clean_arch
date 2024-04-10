import 'package:contact_auth_bloc/src/data/data_sources/auth/auth_data_source.dart';
import 'package:contact_auth_bloc/src/data/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthDataSource dataSource,
  }) : _dataSource = dataSource;

  final AuthDataSource _dataSource;

  @override
  Future<bool> signInWithGoogle() async => await _dataSource.signInWithGoogle();

  @override
  Future<void> signOut() async => await _dataSource.signOut();

  @override
  Stream<bool> isLoggedIn() => _dataSource.isLoggedIn();
}
