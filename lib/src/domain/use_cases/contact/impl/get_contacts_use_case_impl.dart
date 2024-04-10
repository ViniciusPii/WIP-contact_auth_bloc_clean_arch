import 'package:contact_auth_bloc/src/data/repositories/contact/contacts_repository.dart';
import 'package:contact_auth_bloc/src/domain/entities/contact/contact_entity.dart';
import 'package:contact_auth_bloc/src/domain/entities/user/user_entity.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/contact/get_contacts_use_case.dart';
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
    UserEntity user = _getUserUseCase();

    return _repository.getContacts(user.id);
  }
}
