import 'package:contact_auth_bloc/src/domain/entities/user_entity.dart';

sealed class HomeState {
  const HomeState();
}

class HomeStateInitial extends HomeState {
  const HomeStateInitial();
}

class HomeStateSuccess extends HomeState {
  const HomeStateSuccess({required this.user});

  final UserEntity user;
}

class HomeStateError extends HomeState {
  const HomeStateError({required this.message});

  final String message;
}
