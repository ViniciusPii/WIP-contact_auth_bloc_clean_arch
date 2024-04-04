abstract class AuthRepository {
  Future<bool> signInWithGoogle();
  Future<void> signOut();
  Stream<bool> isLoggedIn();
}
