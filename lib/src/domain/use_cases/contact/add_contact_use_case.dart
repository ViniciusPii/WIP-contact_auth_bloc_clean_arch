import 'package:contact_auth_bloc/src/domain/entities/contact/contact_entity.dart';

abstract class AddContactUseCase {
  Future<void> call(ContactEntity contact);
}
