class AppGenericException implements Exception {
  AppGenericException({this.message});

  final String? message;
}

class AppNetworkException implements Exception {
  AppNetworkException({this.message});

  final String? message;
}
