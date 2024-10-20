class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() {
    return "CustomException: $message";
  }
}

class ServerValidationError implements Exception {
  final String message;
  ServerValidationError(this.message);

  @override
  String toString() => '$message';
}

class UnAuthorizedException implements Exception {
  final String message;
  UnAuthorizedException(this.message);

  @override
  String toString() => '$message';
}

class DoesNotExistException implements Exception {
  final String message;
  DoesNotExistException(this.message);

  @override
  String toString() => '$message';
}

class UnderMaintenanceError implements Exception {
  final String message;
  UnderMaintenanceError(this.message);

  @override
  String toString() => '$message';
}

class FetchDataException implements Exception {
  final String message;
  FetchDataException(this.message);

  @override
  String toString() => '$message';
}
