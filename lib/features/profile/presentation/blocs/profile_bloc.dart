import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_order_history_usecase.dart';
import '../../domain/usecases/get_user_profile_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserProfileUseCase _getUserProfileUseCase;
  final GetOrderHistoryUseCase _getOrderHistoryUseCase;

  ProfileBloc({
    required GetUserProfileUseCase getUserProfileUseCase,
    required GetOrderHistoryUseCase getOrderHistoryUseCase,
  })  : _getUserProfileUseCase = getUserProfileUseCase,
        _getOrderHistoryUseCase = getOrderHistoryUseCase,
        super(const ProfileInitial()) {
    on<LoadProfileEvent>(_onLoadProfile);
    on<RefreshProfileEvent>(_onRefreshProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());
    await _loadProfileData(emit);
  }

  Future<void> _onRefreshProfile(
    RefreshProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    await _loadProfileData(emit);
  }

  Future<void> _loadProfileData(Emitter<ProfileState> emit) async {
    final userResult = await _getUserProfileUseCase();
    final ordersResult = await _getOrderHistoryUseCase();

    userResult.fold(
      (failure) => emit(ProfileError(failure.message)),
      (user) {
        ordersResult.fold(
          (failure) => emit(ProfileError(failure.message)),
          (orders) => emit(ProfileLoaded(user: user, orderHistory: orders)),
        );
      },
    );
  }
}
