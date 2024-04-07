import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/features/contact/domain/entities/contact_entity.dart';
import 'package:contact_auth_bloc/src/features/contact/domain/use_cases/delete_contact_use_case.dart';
import 'package:contact_auth_bloc/src/features/contact/domain/use_cases/get_contacts_use_case.dart';
import 'package:contact_auth_bloc/src/features/contact/presentation/home/controller/home_state.dart';
import 'package:contact_auth_bloc/src/features/shared/domain/entities/user_entity.dart';
import 'package:contact_auth_bloc/src/features/shared/domain/use_cases/get_user_use_case.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetUserUseCase getUserUseCase,
    required GetContactsUseCase getContactsUseCase,
    required DeleteContactUseCase deleteContactUseCase,
  })  : _getUserUseCase = getUserUseCase,
        _getContactsUseCase = getContactsUseCase,
        _deleteContactUseCase = deleteContactUseCase,
        super(const HomeLoadingState());

  final GetUserUseCase _getUserUseCase;
  final GetContactsUseCase _getContactsUseCase;
  final DeleteContactUseCase _deleteContactUseCase;

  void getHomeData() async {
    try {
      emit(const HomeLoadingState());

      final UserEntity user = _getUserUseCase();

      _getContactsUseCase().listen((contacts) {
        emit(HomeSuccesState(user: user, contacts: contacts));
      });
    } on AppGenericException catch (_) {
      emit(const HomeErrorState());
    }
  }

  void deleteContact(ContactEntity contact) async {
    try {
      await _deleteContactUseCase(contact);
    } on AppGenericException catch (_) {
      emit(const HomeErrorState());
    }
  }
}
