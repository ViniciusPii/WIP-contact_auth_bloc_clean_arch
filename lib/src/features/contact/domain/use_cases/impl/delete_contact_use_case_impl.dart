import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/features/contact/data/repositories/contacts_repository.dart';
import 'package:contact_auth_bloc/src/features/contact/domain/entities/contact_entity.dart';
import 'package:contact_auth_bloc/src/features/contact/domain/use_cases/delete_contact_use_case.dart';
import 'package:contact_auth_bloc/src/features/shared/domain/entities/user_entity.dart';
import 'package:contact_auth_bloc/src/features/shared/domain/use_cases/get_user_use_case.dart';

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
    } on AppGenericException catch (_) {
      throw AppGenericException();
    }
  }
}
