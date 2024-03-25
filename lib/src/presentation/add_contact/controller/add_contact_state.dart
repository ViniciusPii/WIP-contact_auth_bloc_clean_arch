sealed class AddContactState {
  const AddContactState();
}

class AddContactStateInitial extends AddContactState {
  const AddContactStateInitial();
}

class AddContactStateLoading extends AddContactState {
  const AddContactStateLoading();
}

class AddContactStateSuccess extends AddContactState {
  const AddContactStateSuccess();
}

class AddContactStateError extends AddContactState {
  const AddContactStateError({required this.message});

  final String message;
}
