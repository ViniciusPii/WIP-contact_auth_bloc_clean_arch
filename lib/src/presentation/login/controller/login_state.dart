sealed class LoginState {
  const LoginState();
}

class LoginStateInitial extends LoginState {
  const LoginStateInitial();
}

class LoginStateLoading extends LoginState {
  const LoginStateLoading();
}

class LoginStateSuccess extends LoginState {
  const LoginStateSuccess();
}

class LoginStateError extends LoginState {
  const LoginStateError({required this.message});

  final String message;
}
