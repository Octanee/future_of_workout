import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'workout_logs_details_event.dart';
part 'workout_logs_details_state.dart';

class WorkoutLogsDetailsBloc extends Bloc<WorkoutLogsDetailsEvent, WorkoutLogsDetailsState> {
  WorkoutLogsDetailsBloc() : super(WorkoutLogsDetailsInitial()) {
    on<WorkoutLogsDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
