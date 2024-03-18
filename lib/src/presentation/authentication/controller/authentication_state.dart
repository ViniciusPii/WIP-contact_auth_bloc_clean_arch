sealed class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationStateInitial extends AuthenticationState {
  const AuthenticationStateInitial();
}

class AuthenticationStateAuthAuthenticated extends AuthenticationState {
  const AuthenticationStateAuthAuthenticated();
}

class AuthenticationStateAuthUnauthenticated extends AuthenticationState {
  const AuthenticationStateAuthUnauthenticated();
}
