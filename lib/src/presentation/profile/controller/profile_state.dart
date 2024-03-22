import 'package:contact_auth_bloc/src/domain/entities/user_entity.dart';

sealed class ProfileState {
  const ProfileState();
}

class ProfileStateInitial extends ProfileState {
  const ProfileStateInitial();
}

// SignOut

class ProfileStateSignOutLoading extends ProfileState {
  const ProfileStateSignOutLoading();
}

class ProfileStateSignOutError extends ProfileState {
  const ProfileStateSignOutError({required this.message});

  final String message;
}

// Update User Name
class ProfileStateUpdateUserLoading extends ProfileState {
  const ProfileStateUpdateUserLoading();
}

class ProfileStateUpdateUserSuccess extends ProfileState {
  const ProfileStateUpdateUserSuccess({required this.message});

  final String message;
}

class ProfileStateUpdateUserError extends ProfileState {
  const ProfileStateUpdateUserError({required this.message});

  final String message;
}

// Get User
class ProfileStateUserSuccess extends ProfileState {
  const ProfileStateUserSuccess({required this.user});

  final UserEntity user;
}

class ProfileStateUserError extends ProfileState {
  const ProfileStateUserError({required this.message});

  final String message;
}
