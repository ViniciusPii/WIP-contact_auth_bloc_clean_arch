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
class HomeStateUserSucces extends HomeState {
  const HomeStateUserSucces({required this.user});

  final UserEntity user;
}

class HomeStateUserError extends HomeState {
  const HomeStateUserError({required this.message});

  final String message;
}
