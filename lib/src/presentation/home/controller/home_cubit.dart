import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/domain/entities/user_entity.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/get_user_use_case.dart';
import 'package:contact_auth_bloc/src/presentation/home/controller/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetUserUseCase getUserUseCase,
  })  : _getUserUseCase = getUserUseCase,
        super(const HomeStateInitial());

  final GetUserUseCase _getUserUseCase;

  void getUser() {
    try {
      final UserEntity user = _getUserUseCase.getUser();
      emit(HomeStateSuccess(user: user));
    } on AppGenericException catch (e) {
      emit(HomeStateError(message: e.message ?? ''));
    }
  }
}
