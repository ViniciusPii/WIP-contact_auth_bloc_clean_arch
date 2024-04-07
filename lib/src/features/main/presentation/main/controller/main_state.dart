sealed class MainState {
  const MainState({
    required this.currentPage,
    required this.hideBottomNavigation,
  });

  final int currentPage;
  final bool hideBottomNavigation;
}

class MainNavigationState extends MainState {
  MainNavigationState({required super.currentPage, required super.hideBottomNavigation});
}
