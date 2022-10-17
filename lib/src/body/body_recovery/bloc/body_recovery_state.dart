part of 'body_recovery_bloc.dart';

enum BodyRecoveryStatus {
  initial,
  loading,
  success,
  failure,
}

class BodyRecoveryState extends Equatable {
  const BodyRecoveryState({
    this.status = BodyRecoveryStatus.initial,
    this.body,
    this.isFront = true,
  });

  final BodyRecoveryStatus status;
  final Body? body;
  final bool isFront;

  BodyRecoveryState copyWith({
    BodyRecoveryStatus? status,
    Body? body,
    bool? isFront,
  }) {
    return BodyRecoveryState(
      status: status ?? this.status,
      body: body ?? this.body,
      isFront: isFront ?? this.isFront,
    );
  }

  @override
  List<Object?> get props => [status, body, isFront];
}
