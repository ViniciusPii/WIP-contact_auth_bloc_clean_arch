import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/features/contact/domain/entities/contact_entity.dart';
import 'package:contact_auth_bloc/src/features/contact/domain/use_cases/add_contact_use_case.dart';
import 'package:contact_auth_bloc/src/features/contact/presentation/add_contact/controller/add_contact_state.dart';

class AddContactCubit extends Cubit<AddContactState> {
  AddContactCubit({
    required AddContactUseCase addContactUseCase,
  })  : _addContactUseCase = addContactUseCase,
        super(const AddContactInitialState());

  final AddContactUseCase _addContactUseCase;

  Future<void> addContact(ContactEntity contact) async {
    try {
      emit(const AddContactLoadingState());

      await _addContactUseCase(contact);
    } on AppNetworkMessageException catch (e) {
      emit(AddContactNetworkErrorState(message: e.message));
    }
  }
}
