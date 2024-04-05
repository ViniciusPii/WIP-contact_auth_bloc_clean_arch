import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:contact_auth_bloc/src/features/auth/presentation/login/controller/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
  })  : _signInWithGoogleUseCase = signInWithGoogleUseCase,
        super(const LoginStateInitial());

  final SignInWithGoogleUseCase _signInWithGoogleUseCase;

  Future<void> signInWithGoogle() async {
    try {
      emit(const LoginStateLoading());

      await _signInWithGoogleUseCase();
      emit(const LoginStateSuccess());
    } on AppGenericMessageException catch (e) {
      emit(LoginStateError(message: e.message));
    } on AppNetworkMessageException catch (e) {
      emit(LoginStateNetworkError(message: e.message));
    }
  }
}