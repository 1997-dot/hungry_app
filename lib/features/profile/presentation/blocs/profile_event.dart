import 'package:equatable/equatable.dart';

/// Base class for profile events
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load profile data
class LoadProfileEvent extends ProfileEvent {
  const LoadProfileEvent();
}

/// Event to refresh profile data
class RefreshProfileEvent extends ProfileEvent {
  const RefreshProfileEvent();
}
