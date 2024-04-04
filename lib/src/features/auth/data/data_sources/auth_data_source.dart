abstract class AuthDataSource {
  Future<bool> signInWithGoogle();
  Future<void> signOut();
  Stream<bool> isLoggedIn();
}
