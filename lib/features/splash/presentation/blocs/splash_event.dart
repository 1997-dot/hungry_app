part of 'splash_bloc.dart';

/// Base class for all Splash events
abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object?> get props => [];
}

/// Event to check authentication status
class CheckAuthStatusEvent extends SplashEvent {
  const CheckAuthStatusEvent();
}
