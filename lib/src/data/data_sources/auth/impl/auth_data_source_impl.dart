import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/data/data_sources/auth/auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthDataSourceImpl implements AuthDataSource {
  AuthDataSourceImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw AppGenericMessageException(message: 'Login cancelado pelo usuário!');
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential).timeout(const Duration(seconds: 5));

      return true;
    } on AppGenericMessageException catch (e) {
      throw AppGenericMessageException(message: e.message);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw AppNetworkMessageException(message: 'Verifique a sua conexão!');
      }
      throw AppGenericMessageException(message: 'Algo deu errado! Tente novamente!');
    } catch (e) {
      throw AppGenericMessageException(message: 'Algo deu errado! Tente novamente!');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      throw AppGenericMessageException(message: 'Erro inesperado! Tente novamente mais tarde!');
    }
  }

  @override
  Stream<bool> isLoggedIn() {
    try {
      return _firebaseAuth.authStateChanges().map((user) => user != null);
    } catch (e) {
      throw AppGenericException();
    }
  }
}
