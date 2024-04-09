import 'package:contact_auth_bloc/src/domain/entities/user/user_entity.dart';

abstract class UserRepository {
  UserEntity getUser();
  Future<void> updateUserName(String name);
}
