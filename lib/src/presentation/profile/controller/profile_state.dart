import 'package:contact_auth_bloc/src/domain/entities/user_entity.dart';

sealed class ProfileState {
  const ProfileState();
}

class ProfileStateInitial extends ProfileState {
  const ProfileStateInitial();
}

class ProfileStateUpdateUserLoading extends ProfileState {
  const ProfileStateUpdateUserLoading();
}

class ProfileStateUpdateUserSuccess extends ProfileState {
  const ProfileStateUpdateUserSuccess();
}

class ProfileStateUpdateUserError extends ProfileState {
  const ProfileStateUpdateUserError({required this.message});

  final String message;
}

class ProfileStateUserSuccess extends ProfileState {
  const ProfileStateUserSuccess({required this.user});

  final UserEntity user;
}

class ProfileStateUserError extends ProfileState {
  const ProfileStateUserError({required this.message});

  final String message;
}

class ProfileStateError extends ProfileState {
  const ProfileStateError({required this.message});

  final String message;
}
