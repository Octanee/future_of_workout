part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsLoading extends SettingsEvent {
  const SettingsLoading();
}

class SettingsChangeData extends SettingsEvent {
  const SettingsChangeData({required this.user});

  final User user;

  @override
  List<Object> get props => [user];
}
