part of 'settings_bloc.dart';

enum SettingsStatus {
  initial,
  loading,
  success,
  failure,
}

class SettingsState extends Equatable {
  const SettingsState({this.status = SettingsStatus.initial, this.user});

  final SettingsStatus status;
  final User? user;

  @override
  List<Object?> get props => [status, user];

  SettingsState copyWith({
    SettingsStatus? status,
    User? user,
  }) {
    return SettingsState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
