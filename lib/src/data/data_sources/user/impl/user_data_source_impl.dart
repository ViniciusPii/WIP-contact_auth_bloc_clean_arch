import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/data/adapters/user/user_entity_adapter.dart';
import 'package:contact_auth_bloc/src/data/data_sources/user/user_data_source.dart';
import 'package:contact_auth_bloc/src/domain/entities/user/user_entity.dart';
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

      return UserEntityAdapter.from(user);
    } catch (e) {
      throw AppGenericException();
    }
  }

  @override
  Future<void> updateUserName(String name) async {
    try {
      final User? user = _firebaseAuth.currentUser;

      await user!.updateDisplayName(name).timeout(const Duration(seconds: 5));
    } on FirebaseException catch (e) {
      if (e.code == 'network-request-failed') {
        throw AppNetworkMessageException(message: 'Sem conexão com a internet!');
      }

      throw AppGenericMessageException(message: 'Estamos passando por indisponibilidades!');
    } catch (e) {
      throw AppGenericMessageException(message: 'Estamos passando por indisponibilidades!');
    }
  }
}
