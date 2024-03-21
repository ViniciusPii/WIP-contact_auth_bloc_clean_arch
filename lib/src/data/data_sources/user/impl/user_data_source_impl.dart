import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/data/adapters/user_entity_adapter.dart';
import 'package:contact_auth_bloc/src/data/data_sources/user/user_data_source.dart';
import 'package:contact_auth_bloc/src/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataSourceImpl implements UserDataSource {
  UserDataSourceImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  UserEntity getUser() {
    try {
      final User? user = _firebaseAuth.currentUser;

      if (user != null) {
        return UserEntityAdapter.from(user);
      } else {
        throw AppGenericException(message: 'Usuário não encontrado!');
      }
    } on AppGenericException catch (e) {
      throw AppGenericException(message: e.message);
    } catch (e) {
      throw AppGenericException(message: 'Erro inesperado!');
    }
  }

  @override
  Future<void> updateUserName(String name) async {
    try {
      final User? user = _firebaseAuth.currentUser;

      if (user != null) {
        await user.updateDisplayName(name).timeout(const Duration(seconds: 5));
      } else {
        throw AppGenericException(message: 'Usuário não encontrado!');
      }
    } on FirebaseException catch (e) {
      if (e.code == 'network-request-failed') {
        throw AppGenericException(message: 'Sem conexão com a internet!');
      }
      throw AppGenericException(message: 'Erro inesperado no Firebase!');
    } on AppGenericException catch (e) {
      throw AppGenericException(message: e.message);
    } catch (e) {
      throw AppGenericException(message: 'Estamos passando por indisponibilidades!');
    }
  }
}
