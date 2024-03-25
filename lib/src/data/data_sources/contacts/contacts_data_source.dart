import 'package:contact_auth_bloc/src/domain/entities/contact_entity.dart';

abstract class ContactsDataSource {
  Future<void> addContact(ContactEntity contact, String userId);
}
