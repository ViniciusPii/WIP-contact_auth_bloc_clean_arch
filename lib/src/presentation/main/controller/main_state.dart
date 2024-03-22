sealed class MainState {
  const MainState({
    required this.currentPage,
    required this.hideNavigation,
  });

  final int currentPage;
  final bool hideNavigation;
}

class MainNavigationState extends MainState {
  MainNavigationState({required super.currentPage, required super.hideNavigation});
}
