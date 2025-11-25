// Custom exceptions for the data layer
// These are thrown when something goes wrong during data operations

/// Exception thrown when a server error occurs
class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException({
    this.message = 'Server error occurred',
    this.statusCode,
  });

  @override
  String toString() => 'ServerException: $message (Status Code: $statusCode)';
}

/// Exception thrown when a cache error occurs
class CacheException implements Exception {
  final String message;

  CacheException({this.message = 'Cache error occurred'});

  @override
  String toString() => 'CacheException: $message';
}

/// Exception thrown when an authentication error occurs
class AuthException implements Exception {
  final String message;

  AuthException({this.message = 'Authentication error occurred'});

  @override
  String toString() => 'AuthException: $message';
}

/// Exception thrown when a network error occurs
class NetworkException implements Exception {
  final String message;

  NetworkException({this.message = 'Network error occurred'});

  @override
  String toString() => 'NetworkException: $message';
}

/// Exception thrown when a validation error occurs
class ValidationException implements Exception {
  final String message;
  final Map<String, dynamic>? errors;

  ValidationException({
    this.message = 'Validation error occurred',
    this.errors,
  });

  @override
  String toString() => 'ValidationException: $message ${errors ?? ''}';
}

/// Exception thrown when a resource is not found
class NotFoundException implements Exception {
  final String message;

  NotFoundException({this.message = 'Resource not found'});

  @override
  String toString() => 'NotFoundException: $message';
}
