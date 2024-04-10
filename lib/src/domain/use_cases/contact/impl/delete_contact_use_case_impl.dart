import 'package:contact_auth_bloc/src/data/repositories/contact/contacts_repository.dart';
import 'package:contact_auth_bloc/src/domain/entities/contact/contact_entity.dart';
import 'package:contact_auth_bloc/src/domain/entities/user/user_entity.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/contact/delete_contact_use_case.dart';
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
    UserEntity user = _getUserUseCase();

    await _repository.deleteContact(contact, user.id);
  }
}
