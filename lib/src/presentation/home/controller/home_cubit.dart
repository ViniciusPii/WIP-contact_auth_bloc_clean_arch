import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/domain/entities/contact_entity.dart';
import 'package:contact_auth_bloc/src/domain/entities/user_entity.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/contacts/delete_contact_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/contacts/get_contacts_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/get_user_use_case.dart';
import 'package:contact_auth_bloc/src/presentation/home/controller/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetUserUseCase getUserUseCase,
    required GetContactsUseCase getContactsUseCase,
    required DeleteContactUseCase deleteContactUseCase,
  })  : _getUserUseCase = getUserUseCase,
        _getContactsUseCase = getContactsUseCase,
        _deleteContactUseCase = deleteContactUseCase,
        super(const HomeStateInitial());

  final GetUserUseCase _getUserUseCase;
  final GetContactsUseCase _getContactsUseCase;
  final DeleteContactUseCase _deleteContactUseCase;

  void getHomeData() async {
    try {
      emit(const HomeStateLoading());

      final UserEntity user = _getUserUseCase();

      _getContactsUseCase().listen((contacts) {
        emit(HomeStateSucces(user: user, contacts: contacts));
      });
    } on DeprecatedAppGenericException catch (_) {
      emit(const HomeStateError());
    }
  }

  void deleteContact(ContactEntity contact) async {
    try {
      await _deleteContactUseCase(contact);
    } on DeprecatedAppGenericException catch (_) {
      emit(const HomeStateError());
    }
  }
}
