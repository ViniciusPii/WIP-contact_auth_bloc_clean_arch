import 'package:contact_auth_bloc/src/domain/entities/contact/contact_entity.dart';
import 'package:contact_auth_bloc/src/domain/entities/user/user_entity.dart';

sealed class HomeState {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class HomeSuccesState extends HomeState {
  const HomeSuccesState({
    required this.user,
    required this.contacts,
  });

  final UserEntity user;
  final List<ContactEntity> contacts;
}

class HomeErrorState extends HomeState {
  const HomeErrorState();
}
