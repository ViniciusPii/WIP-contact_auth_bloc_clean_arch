import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/data/repositories/contacts/contacts_repository.dart';
import 'package:contact_auth_bloc/src/domain/entities/contact_entity.dart';
import 'package:contact_auth_bloc/src/domain/entities/user_entity.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/contacts/get_contacts_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/get_user_use_case.dart';

class GetContactsUseCaseImpl implements GetContactsUseCase {
  GetContactsUseCaseImpl({
    required GetUserUseCase getUserUseCase,
    required ContactsRepository repository,
  })  : _getUserUseCase = getUserUseCase,
        _repository = repository;

  final GetUserUseCase _getUserUseCase;
  final ContactsRepository _repository;

  @override
  Stream<List<ContactEntity>> call() {
    try {
      UserEntity user = _getUserUseCase();

      return _repository.getContacts(user.id);
    } on AppGenericException catch (_) {
      throw AppGenericException();
    }
  }
}
