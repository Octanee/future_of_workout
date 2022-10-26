part of 'app_bloc.dart';

enum AppStatus {
  initial,
  loading,
  loaded,
  newUser,
  failure,
}

class AppState extends Equatable {
  const AppState({
    this.status = AppStatus.initial,
    this.user,
  });

  final AppStatus status;
  final User? user;

  @override
  List<Object?> get props => [status, user];

  AppState copyWith({
    AppStatus? status,
    User? user,
  }) {
    return AppState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
