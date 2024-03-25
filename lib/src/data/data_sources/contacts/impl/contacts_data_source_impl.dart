import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/data/adapters/contact_entity_adapter.dart';
import 'package:contact_auth_bloc/src/data/data_sources/contacts/contacts_data_source.dart';
import 'package:contact_auth_bloc/src/domain/entities/contact_entity.dart';

class ContactsDataSourceImpl implements ContactsDataSource {
  ContactsDataSourceImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  CollectionReference _contactsCollection(String userId) =>
      _firestore.collection('contacts').doc(userId).collection('contacts_list');

  @override
  Future<void> addContact(ContactEntity contact, String userId) async {
    try {
      await _contactsCollection(userId).add(contact.toMap());
    } catch (e) {
      AppGenericException(message: 'Erro ao cadastrar contato!');
    }
  }
}