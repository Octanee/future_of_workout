import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'current_workout_event.dart';
part 'current_workout_state.dart';

class CurrentWorkoutBloc extends Bloc<CurrentWorkoutEvent, CurrentWorkoutState> {
  CurrentWorkoutBloc() : super(CurrentWorkoutInitial()) {
    on<CurrentWorkoutEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
