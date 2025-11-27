import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/check_auth_usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckAuthUseCase _checkAuthUseCase;

  SplashBloc(this._checkAuthUseCase) : super(SplashInitial()) {
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatusEvent event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashLoading());

    // Wait for 2 seconds (splash duration)
    await Future.delayed(const Duration(seconds: 2));

    // Check if user is authenticated
    final isAuthenticated = _checkAuthUseCase();

    if (isAuthenticated) {
      emit(SplashAuthenticated());
    } else {
      emit(SplashUnauthenticated());
    }
  }
}
