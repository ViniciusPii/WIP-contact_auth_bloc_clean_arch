import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/features/auth/presentation/welcome/controller/welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(const WelcomeStateInitial());
}
