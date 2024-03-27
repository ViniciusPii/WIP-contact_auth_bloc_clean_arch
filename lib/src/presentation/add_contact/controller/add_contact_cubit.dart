import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/domain/entities/contact_entity.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/contacts/add_contact_use_case.dart';
import 'package:contact_auth_bloc/src/presentation/add_contact/controller/add_contact_state.dart';

class AddContactCubit extends Cubit<AddContactState> {
  AddContactCubit({
    required AddContactUseCase addContactUseCase,
  })  : _addContactUseCase = addContactUseCase,
        super(const AddContactStateInitial());

  final AddContactUseCase _addContactUseCase;

  Future<void> addContact(ContactEntity contact) async {
    try {
      emit(const AddContactStateLoading());

      await _addContactUseCase(contact);
      emit(const AddContactStateSuccess());
    } on DeprecatedAppGenericException catch (e) {
      emit(AddContactStateError(message: e.message ?? ''));
    }
  }
}
