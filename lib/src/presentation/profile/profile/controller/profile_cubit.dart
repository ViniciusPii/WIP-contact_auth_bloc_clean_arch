import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/domain/entities/user/user_entity.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/sign_out_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/get_user_use_case.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/user/update_user_name_use_case.dart';
import 'package:contact_auth_bloc/src/presentation/profile/profile/controller/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required SignOutUseCase signOutUseCase,
    required GetUserUseCase getUserUseCase,
    required UpdateUserNameUseCase updateUserNameUseCase,
  })  : _signOutUseCase = signOutUseCase,
        _getUserUseCase = getUserUseCase,
        _updateUserNameUseCase = updateUserNameUseCase,
        super(const ProfileInitialState());

  final SignOutUseCase _signOutUseCase;
  final GetUserUseCase _getUserUseCase;
  final UpdateUserNameUseCase _updateUserNameUseCase;

  Future<void> updateUserName(String name) async {
    try {
      emit(const ProfileUpdateUserLoadingState());

      await _updateUserNameUseCase(name);
      emit(const ProfileUpdateUserSuccessState(message: 'Nome alterado com sucesso!'));
    } on DeprecatedAppGenericException catch (e) {
      emit(ProfileUpdateUserErrorState(message: e.message ?? ''));
    }
  }

  void getUser() {
    try {
      final UserEntity user = _getUserUseCase();
      emit(ProfileUserSuccessState(user: user));
    } on AppGenericException catch (_) {
      emit(const ProfileUserErrorState());
    }
  }

  Future<void> signOut() async {
    try {
      await _signOutUseCase();
    } on AppGenericException catch (_) {
      emit(const ProfileSignOutErrorState());
    }
  }
}
