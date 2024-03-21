sealed class NavigationState {
  const NavigationState({
    required this.currentPageIndex,
  });

  final int currentPageIndex;
}

class NavigationStateCurrentPage extends NavigationState {
  const NavigationStateCurrentPage({required super.currentPageIndex});
}
