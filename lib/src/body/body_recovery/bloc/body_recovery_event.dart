part of 'body_recovery_bloc.dart';

abstract class BodyRecoveryEvent extends Equatable {
  const BodyRecoveryEvent();

  @override
  List<Object> get props => [];
}

class BodyRecoveryLoading extends BodyRecoveryEvent {
  const BodyRecoveryLoading();
}

class BodyRecoveryChangePosition extends BodyRecoveryEvent {
  const BodyRecoveryChangePosition({required this.isFront});

  final bool isFront;
  
  @override
  List<Object> get props => [isFront];
}
