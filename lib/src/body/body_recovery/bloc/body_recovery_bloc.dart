import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'body_recovery_event.dart';
part 'body_recovery_state.dart';

class BodyRecoveryBloc extends Bloc<BodyRecoveryEvent, BodyRecoveryState> {
  BodyRecoveryBloc() : super(BodyRecoveryInitial()) {
    on<BodyRecoveryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
