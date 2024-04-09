import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/data/repositories/contact/contacts_repository.dart';
import 'package:contact_auth_bloc/src/domain/entities/contact/contact_entity.dart';
import 'package:contact_auth_bloc/src/domain/entities/user/user_entity.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/contact/add_contact_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/get_user_use_case.dart';

class AddContactUseCaseImpl implements AddContactUseCase {
  AddContactUseCaseImpl({
    required GetUserUseCase getUserUseCase,
    required ContactsRepository repository,
  })  : _getUserUseCase = getUserUseCase,
        _repository = repository;

  final ContactsRepository _repository;
  final GetUserUseCase _getUserUseCase;

  @override
  Future<void> call(ContactEntity contact) async {
    try {
      UserEntity user = _getUserUseCase();

      return _repository.addContact(contact, user.id);
    } on AppNetworkMessageException catch (e) {
      throw AppNetworkMessageException(message: e.message);
    }
  }
}
