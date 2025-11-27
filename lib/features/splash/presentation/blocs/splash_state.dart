part of 'splash_bloc.dart';

/// Base class for all Splash states
abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class SplashInitial extends SplashState {}

/// Loading state (showing splash screen)
class SplashLoading extends SplashState {}

/// User is authenticated - navigate to home
class SplashAuthenticated extends SplashState {}

/// User is not authenticated - navigate to login
class SplashUnauthenticated extends SplashState {}
