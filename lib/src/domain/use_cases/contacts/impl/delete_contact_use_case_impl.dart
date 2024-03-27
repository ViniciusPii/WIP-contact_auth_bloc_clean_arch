import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/data/repositories/contacts/contacts_repository.dart';
import 'package:contact_auth_bloc/src/domain/entities/contact_entity.dart';
import 'package:contact_auth_bloc/src/domain/entities/user_entity.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/contacts/delete_contact_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/get_user_use_case.dart';

class DeleteContactUseCaseImpl implements DeleteContactUseCase {
  DeleteContactUseCaseImpl({
    required GetUserUseCase getUserUseCase,
    required ContactsRepository repository,
  })  : _getUserUseCase = getUserUseCase,
        _repository = repository;

  final GetUserUseCase _getUserUseCase;
  final ContactsRepository _repository;

  @override
  Future<void> call(ContactEntity contact) async {
    try {
      UserEntity user = _getUserUseCase();

      await _repository.deleteContact(contact, user.id);
    } on DeprecatedAppGenericException catch (e) {
      throw DeprecatedAppGenericException(message: e.message);
    }
  }
}
