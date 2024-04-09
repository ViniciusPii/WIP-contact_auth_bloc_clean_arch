sealed class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {
  const LoginInitialState();
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}

class LoginErrorState extends LoginState {
  const LoginErrorState({required this.message});

  final String message;
}

class LoginNetworkErrorState extends LoginState {
  const LoginNetworkErrorState({required this.message});

  final String message;
}
