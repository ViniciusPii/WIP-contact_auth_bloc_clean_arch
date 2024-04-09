sealed class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationInitialState extends AuthenticationState {
  const AuthenticationInitialState();
}

class AuthenticationAuthAuthenticatedState extends AuthenticationState {
  const AuthenticationAuthAuthenticatedState();
}

class AuthenticationAuthUnauthenticatedState extends AuthenticationState {
  const AuthenticationAuthUnauthenticatedState();
}

class AuthenticationErrorState extends AuthenticationState {
  const AuthenticationErrorState();
}
