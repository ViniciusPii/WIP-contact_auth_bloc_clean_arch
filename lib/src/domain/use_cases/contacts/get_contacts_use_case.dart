import 'package:contact_auth_bloc/src/domain/entities/contact_entity.dart';

abstract class GetContactsUseCase {
  Stream<List<ContactEntity>> call();
}
