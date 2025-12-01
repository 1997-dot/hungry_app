import 'package:equatable/equatable.dart';

/// Base class for all failures
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Server failure
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

/// Cache failure
class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

/// Network failure
class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

/// Validation failure
class ValidationFailure extends Failure {
  const ValidationFailure(String message) : super(message);
}

/// Authentication failure
class AuthenticationFailure extends Failure {
  const AuthenticationFailure(String message) : super(message);
}

/// Authorization failure
class AuthorizationFailure extends Failure {
  const AuthorizationFailure(String message) : super(message);
}
