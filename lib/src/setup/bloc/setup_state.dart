part of 'setup_bloc.dart';

enum SetupStatus {
  initial,
  updating,
  finish,
  failure,
}

class SetupState extends Equatable {
  const SetupState({
    this.status = SetupStatus.initial,
    this.user = const User(),
  });

  final SetupStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];

  SetupState copyWith({
    SetupStatus? status,
    User? user,
  }) {
    return SetupState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
