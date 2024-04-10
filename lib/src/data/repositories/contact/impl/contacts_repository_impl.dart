import 'package:contact_auth_bloc/src/data/data_sources/contact/contacts_data_source.dart';
import 'package:contact_auth_bloc/src/data/repositories/contact/contacts_repository.dart';
import 'package:contact_auth_bloc/src/domain/entities/contact/contact_entity.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  ContactsRepositoryImpl({
    required ContactsDataSource dataSource,
  }) : _dataSource = dataSource;

  final ContactsDataSource _dataSource;

  @override
  Future<void> addContact(ContactEntity contact, String userId) async =>
      await _dataSource.addContact(contact, userId);

  @override
  Stream<List<ContactEntity>> getContacts(String userId) => _dataSource.getContacts(userId);

  @override
  Future<void> deleteContact(ContactEntity contact, String userId) =>
      _dataSource.deleteContact(contact, userId);
}
