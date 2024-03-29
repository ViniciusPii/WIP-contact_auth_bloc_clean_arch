import 'package:contact_auth_bloc/src/domain/entities/user_entity.dart';

abstract class UserDataSource {
  UserEntity getUser();
  Future<void> updateUserName(String name);
}
