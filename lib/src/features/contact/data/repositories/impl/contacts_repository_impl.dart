import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/features/contact/data/data_sources/contacts_data_source.dart';
import 'package:contact_auth_bloc/src/features/contact/data/repositories/contacts_repository.dart';
import 'package:contact_auth_bloc/src/features/contact/domain/entities/contact_entity.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  ContactsRepositoryImpl({
    required ContactsDataSource dataSource,
  }) : _dataSource = dataSource;

  final ContactsDataSource _dataSource;

  @override
  Future<void> addContact(ContactEntity contact, String userId) async {
    try {
      return await _dataSource.addContact(contact, userId);
    } on AppNetworkMessageException catch (e) {
      throw AppNetworkMessageException(message: e.message);
    }
  }

  @override
  Stream<List<ContactEntity>> getContacts(String userId) {
    try {
      return _dataSource.getContacts(userId);
    } on AppGenericException catch (_) {
      throw AppGenericException();
    }
  }

  @override
  Future<void> deleteContact(ContactEntity contact, String userId) {
    try {
      return _dataSource.deleteContact(contact, userId);
    } on AppGenericException catch (_) {
      throw AppGenericException();
    }
  }
}
