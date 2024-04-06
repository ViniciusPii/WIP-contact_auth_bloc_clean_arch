import 'package:contact_auth_bloc/src/features/contact/domain/entities/contact_entity.dart';

abstract class DeleteContactUseCase {
  Future<void> call(ContactEntity contactId);
}
