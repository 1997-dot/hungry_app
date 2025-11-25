import 'package:equatable/equatable.dart';

// Failures for Clean Architecture
// These are returned by repositories to the domain/presentation layers

/// Base class for all failures
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Failure when a server error occurs
class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure({
    String message = 'Server error occurred',
    this.statusCode,
  }) : super(message);

  @override
  List<Object?> get props => [message, statusCode];
}

/// Failure when a cache error occurs
class CacheFailure extends Failure {
  const CacheFailure({String message = 'Cache error occurred'}) : super(message);
}

/// Failure when an authentication error occurs
class AuthFailure extends Failure {
  const AuthFailure({String message = 'Authentication failed'}) : super(message);
}

/// Failure when a network error occurs
class NetworkFailure extends Failure {
  const NetworkFailure({String message = 'No internet connection'})
      : super(message);
}

/// Failure when a validation error occurs
class ValidationFailure extends Failure {
  final Map<String, dynamic>? errors;

  const ValidationFailure({
    String message = 'Validation failed',
    this.errors,
  }) : super(message);

  @override
  List<Object?> get props => [message, errors];
}

/// Failure when a resource is not found
class NotFoundFailure extends Failure {
  const NotFoundFailure({String message = 'Resource not found'})
      : super(message);
}

/// Failure for unknown/unexpected errors
class UnknownFailure extends Failure {
  const UnknownFailure({String message = 'An unknown error occurred'})
      : super(message);
}
