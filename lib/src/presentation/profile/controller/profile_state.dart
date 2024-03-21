sealed class ProfileState {
  const ProfileState();
}

class ProfileStateInitial extends ProfileState {
  const ProfileStateInitial();
}

class ProfileStateError extends ProfileState {
  const ProfileStateError({required this.message});

  final String message;
}
