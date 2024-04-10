import 'package:contact_auth_bloc/src/data/data_sources/user/user_data_source.dart';
import 'package:contact_auth_bloc/src/data/repositories/user/user_repository.dart';
import 'package:contact_auth_bloc/src/domain/entities/user/user_entity.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required UserDataSource dataSource,
  }) : _dataSource = dataSource;

  final UserDataSource _dataSource;

  @override
  UserEntity getUser() => _dataSource.getUser();

  @override
  Future<void> updateUserName(String name) => _dataSource.updateUserName(name);
}
