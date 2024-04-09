import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/presentation/auth/welcome/controller/welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(const WelcomeInitialState());
}
