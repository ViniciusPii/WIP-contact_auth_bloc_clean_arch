import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/sign_out_use_case.dart';
import 'package:contact_auth_bloc/src/presentation/home/controller/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required SignOutUseCase signOutUseCase,
  })  : _signOutUseCase = signOutUseCase,
        super(const HomeStateInitial());

  final SignOutUseCase _signOutUseCase;

  Future<void> signOut() async {
    try {
      await _signOutUseCase();
    } on AppGenericException catch (e) {
      emit(HomeStateError(message: e.message ?? ''));
    }
  }
}
