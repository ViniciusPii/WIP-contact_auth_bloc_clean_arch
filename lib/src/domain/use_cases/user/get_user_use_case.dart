import 'package:contact_auth_bloc/src/domain/entities/user/user_entity.dart';

abstract class GetUserUseCase {
  UserEntity call();
}
