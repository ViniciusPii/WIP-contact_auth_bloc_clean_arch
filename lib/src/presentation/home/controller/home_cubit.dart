import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/domain/entities/user_entity.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/contacts/get_contacts_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/get_user_use_case.dart';
import 'package:contact_auth_bloc/src/presentation/home/controller/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetUserUseCase getUserUseCase,
    required GetContactsUseCase getContactsUseCase,
  })  : _getUserUseCase = getUserUseCase,
        _getContactsUseCase = getContactsUseCase,
        super(const HomeStateInitial());

  final GetUserUseCase _getUserUseCase;
  final GetContactsUseCase _getContactsUseCase;

  void getData() async {
    try {
      emit(const HomeStateLoading());

      final UserEntity user = _getUserUseCase();

      _getContactsUseCase().listen((contacts) {
        emit(HomeStateSucces(user: user, contacts: contacts));
      });
    } on AppGenericException catch (e) {
      emit(HomeStateUserError(message: e.message ?? ''));
    }
  }
}
