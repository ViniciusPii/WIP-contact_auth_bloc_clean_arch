sealed class AddContactState {
  const AddContactState();
}

class AddContactInitialState extends AddContactState {
  const AddContactInitialState();
}

class AddContactLoadingState extends AddContactState {
  const AddContactLoadingState();
}

class AddContactNetworkErrorState extends AddContactState {
  const AddContactNetworkErrorState({required this.message});

  final String message;
}
