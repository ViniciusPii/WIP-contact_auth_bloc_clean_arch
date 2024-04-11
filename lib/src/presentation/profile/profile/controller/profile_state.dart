import 'package:contact_auth_bloc/src/domain/entities/user/user_entity.dart';

sealed class ProfileState {
  const ProfileState();
}

class ProfileInitialState extends ProfileState {
  const ProfileInitialState();
}

// SignOut

class ProfileSignOutLoadingState extends ProfileState {
  const ProfileSignOutLoadingState();
}

class ProfileSignOutErrorState extends ProfileState {
  const ProfileSignOutErrorState();
}

// Update User Name
class ProfileUpdateUserLoadingState extends ProfileState {
  const ProfileUpdateUserLoadingState();
}

class ProfileUpdateUserSuccessState extends ProfileState {
  const ProfileUpdateUserSuccessState({required this.message});

  final String message;
}

class ProfileUpdateUserErrorState extends ProfileState {
  const ProfileUpdateUserErrorState({required this.message});

  final String message;
}

// Get User
class ProfileUserSuccessState extends ProfileState {
  const ProfileUserSuccessState({required this.user});

  final UserEntity user;
}

class ProfileUserErrorState extends ProfileState {
  const ProfileUserErrorState();
}
