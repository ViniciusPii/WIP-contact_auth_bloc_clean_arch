import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/is_logged_in_use_case.dart';
import 'package:contact_auth_bloc/src/presentation/authentication/controller/authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required IsLoggedInUseCase isLoggedInUseCase,
  })  : _isLoggedInUseCase = isLoggedInUseCase,
        super(const AuthenticationStateInitial());

  final IsLoggedInUseCase _isLoggedInUseCase;

  StreamSubscription<bool>? _loginSubscription;

  void isLoggedIn() async {
    await Future.delayed(const Duration(seconds: 2));

    _loginSubscription = _isLoggedInUseCase().listen(
      (user) {
        if (user) {
          emit(const AuthenticationStateAuthAuthenticated());
        } else {
          emit(const AuthenticationStateAuthUnauthenticated());
        }
      },
    );
  }

  @override
  Future<void> close() {
    _loginSubscription?.cancel();
    return super.close();
  }
}
