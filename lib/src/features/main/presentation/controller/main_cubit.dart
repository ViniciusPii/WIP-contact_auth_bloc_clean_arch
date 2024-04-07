import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/features/main/presentation/controller/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainNavigationState(currentPage: 0, hideBottomNavigation: false));

  void changeBottomNavigator({required bool isHide, required int pageIndex}) =>
      emit(MainNavigationState(currentPage: pageIndex, hideBottomNavigation: isHide));
}
