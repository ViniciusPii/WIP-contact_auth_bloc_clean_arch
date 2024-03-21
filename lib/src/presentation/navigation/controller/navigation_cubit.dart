import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/presentation/navigation/controller/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationStateCurrentPage(currentPageIndex: 0));

  void changePage(int pageIndex) => emit(NavigationStateCurrentPage(currentPageIndex: pageIndex));
}
