part of 'app_bloc.dart';

enum AppStatus {
  initial,
  loading,
  loaded,
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
    User? Function()? user,
  }) {
    return AppState(
      status: status ?? this.status,
      user: user != null ? user() : this.user,
    );
  }
}
