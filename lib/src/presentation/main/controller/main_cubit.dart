import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/presentation/main/controller/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainNavigationState(currentPage: 0, hideNavigation: false));

  void changePage({required int pageIndex}) =>
      emit(MainNavigationState(currentPage: pageIndex, hideNavigation: false));

  void hideNavigation({required bool isHide, required int pageIndex}) =>
      emit(MainNavigationState(currentPage: pageIndex, hideNavigation: isHide));
}
