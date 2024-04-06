import 'package:contact_auth_bloc/src/features/contact/domain/entities/contact_entity.dart';

abstract class GetContactsUseCase {
  Stream<List<ContactEntity>> call();
}
