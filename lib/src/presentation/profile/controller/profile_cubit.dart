import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/core/errors/app_exceptions.dart';
import 'package:contact_auth_bloc/src/domain/use_cases/auth/sign_out_use_case.dart';
import 'package:contact_auth_bloc/src/presentation/profile/controller/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required SignOutUseCase signOutUseCase})
      : _signOutUseCase = signOutUseCase,
        super(const ProfileStateInitial());

  final SignOutUseCase _signOutUseCase;

  Future<void> signOut() async {
    try {
      await _signOutUseCase();
    } on AppGenericException catch (e) {
      emit(ProfileStateError(message: e.message ?? ''));
    }
  }
}
