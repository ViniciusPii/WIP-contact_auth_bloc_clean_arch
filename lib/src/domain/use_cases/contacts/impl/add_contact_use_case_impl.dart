import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/data/repositories/contacts/contacts_repository.dart';
import 'package:contact_auth_bloc/src/domain/entities/contact_entity.dart';
import 'package:contact_auth_bloc/src/domain/entities/user_entity.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/contacts/add_contact_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/get_user_use_case.dart';

class AddContactUseCaseImpl implements AddContactUseCase {
  AddContactUseCaseImpl({
    required GetUserUseCase getUserUseCase,
    required ContactsRepository repository,
  })  : _getUserUseCase = getUserUseCase,
        _repository = repository;

  final ContactsRepository _repository;
  final GetUserUseCase _getUserUseCase;

  late final UserEntity _user = _getUserUseCase();

  @override
  Future<void> call(ContactEntity contact) async {
    try {
      return _repository.addContact(contact, _user.id);
    } on AppGenericException catch (e) {
      throw AppGenericException(message: e.message);
    }
  }
}
