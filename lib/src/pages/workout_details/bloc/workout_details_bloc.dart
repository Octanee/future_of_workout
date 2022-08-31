import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'workout_details_event.dart';
part 'workout_details_state.dart';

class WorkoutDetailsBloc
    extends Bloc<WorkoutDetailsEvent, WorkoutDetailsState> {
  WorkoutDetailsBloc() : super(WorkoutDetailsInitial()) {
    on<WorkoutDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
