class DeprecatedAppGenericException implements Exception {
  DeprecatedAppGenericException({this.message});

  final String? message;
}

class DecprecatedAppNetworkException implements Exception {
  DecprecatedAppNetworkException({this.message});

  final String? message;
}

class AppGenericException implements Exception {}

class AppMessageException implements Exception {
  AppMessageException({
    required this.message,
  });

  final String message;
}

class AppNetworkException implements Exception {}

class AppNetworkMessageException implements Exception {
  AppNetworkMessageException({
    required this.message,
  });

  final String message;
}
