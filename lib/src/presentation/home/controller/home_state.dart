sealed class HomeState {
  const HomeState();
}

class HomeStateInitial extends HomeState {
  const HomeStateInitial();
}

class HomeStateSuccess extends HomeState {
  const HomeStateSuccess();
}

class HomeStateError extends HomeState {
  const HomeStateError({required this.message});

  final String message;
}
