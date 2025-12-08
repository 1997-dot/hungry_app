import 'package:equatable/equatable.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/entities/order_history_entity.dart';

/// Base class for profile states
abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

/// Loading state
class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

/// Profile loaded state
class ProfileLoaded extends ProfileState {
  final UserEntity user;
  final List<OrderHistoryEntity> orderHistory;

  const ProfileLoaded({
    required this.user,
    required this.orderHistory,
  });

  @override
  List<Object?> get props => [user, orderHistory];
}

/// Error state
class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}
