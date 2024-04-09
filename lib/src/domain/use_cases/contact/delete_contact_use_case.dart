import 'package:contact_auth_bloc/src/domain/entities/contact/contact_entity.dart';

abstract class DeleteContactUseCase {
  Future<void> call(ContactEntity contactId);
}
