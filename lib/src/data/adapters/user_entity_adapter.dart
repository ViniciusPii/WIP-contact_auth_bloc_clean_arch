import 'package:contact_auth_bloc/src/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension UserEntityAdapter on UserEntity {
  static UserEntity from(User? user) {
    return UserEntity(
      id: user?.uid ?? '',
      name: user?.displayName ?? '',
      email: user?.email ?? '',
    );
  }
}
