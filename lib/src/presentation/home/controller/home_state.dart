import 'package:contact_auth_bloc/src/domain/entities/contact_entity.dart';
import 'package:contact_auth_bloc/src/domain/entities/user_entity.dart';

sealed class HomeState {
  const HomeState();
}

class HomeStateInitial extends HomeState {
  const HomeStateInitial();
}

class HomeStateLoading extends HomeState {
  const HomeStateLoading();
}

// Get User
class HomeStateSucces extends HomeState {
  const HomeStateSucces({
    required this.user,
    required this.contacts,
  });

  final UserEntity user;
  final List<ContactEntity> contacts;
}

class HomeStateUserError extends HomeState {
  const HomeStateUserError({required this.message});

  final String message;
}
