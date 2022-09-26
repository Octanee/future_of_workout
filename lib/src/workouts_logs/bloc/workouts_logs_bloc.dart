import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'workouts_logs_event.dart';
part 'workouts_logs_state.dart';

class WorkoutsLogsBloc extends Bloc<WorkoutsLogsEvent, WorkoutsLogsState> {
  WorkoutsLogsBloc() : super(WorkoutsLogsInitial());
}
