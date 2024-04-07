import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/features/auth/domain/use_cases/is_logged_in_use_case.dart';
import 'package:contact_auth_bloc/src/features/auth/presentation/authentication/controller/authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required IsLoggedInUseCase isLoggedInUseCase,
  })  : _isLoggedInUseCase = isLoggedInUseCase,
        super(const AuthenticationInitialState());

  final IsLoggedInUseCase _isLoggedInUseCase;

  StreamSubscription<bool>? _loginSubscription;

  void isLoggedIn() async {
    await Future.delayed(const Duration(seconds: 2));

    try {
      _loginSubscription = _isLoggedInUseCase().listen(
        (user) {
          if (user) {
            emit(const AuthenticationAuthAuthenticatedState());
          } else {
            emit(const AuthenticationAuthUnauthenticatedState());
          }
        },
      );
    } on AppGenericException catch (_) {
      emit(const AuthenticationErrorState());
    }
  }

  @override
  Future<void> close() {
    _loginSubscription?.cancel();
    return super.close();
  }
}
