import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/presentation/home/controller/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeStateInitial());
}
