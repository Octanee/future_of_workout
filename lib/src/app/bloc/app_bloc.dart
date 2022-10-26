import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const AppState()) {
    on<AppLoading>(_onLoading);
  }

  final UserRepository _userRepository;

  Future<void> _onLoading(
    AppLoading event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(status: AppStatus.loading));

    await emit.forEach<User?>(
      _userRepository.getUser(),
      onData: (user) =>
          state.copyWith(status: AppStatus.loaded, user: () => user),
      onError: (_, __) => state.copyWith(status: AppStatus.failure),
    );
  }
}
