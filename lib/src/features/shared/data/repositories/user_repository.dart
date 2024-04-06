import 'package:contact_auth_bloc/src/features/shared/domain/entities/user_entity.dart';

abstract class UserRepository {
  UserEntity getUser();
  Future<void> updateUserName(String name);
}
