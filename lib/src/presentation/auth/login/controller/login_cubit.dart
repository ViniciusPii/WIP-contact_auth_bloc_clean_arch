import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/sign_in_with_google_use_case.dart';
import 'package:contact_auth_bloc/src/presentation/auth/login/controller/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
  })  : _signInWithGoogleUseCase = signInWithGoogleUseCase,
        super(const LoginInitialState());

  final SignInWithGoogleUseCase _signInWithGoogleUseCase;

  Future<void> signInWithGoogle() async {
    try {
      emit(const LoginLoadingState());

      await _signInWithGoogleUseCase();
    } on AppGenericMessageException catch (e) {
      emit(LoginErrorState(message: e.message));
    } on AppNetworkMessageException catch (e) {
      emit(LoginNetworkErrorState(message: e.message));
    }
  }
}
