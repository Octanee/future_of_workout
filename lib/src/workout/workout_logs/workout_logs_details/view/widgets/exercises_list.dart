import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';

class ExercisesList extends StatelessWidget {
  const ExercisesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutLogsDetailsBloc, WorkoutLogsDetailsState>(
      buildWhen: (previous, current) =>
          previous.workoutLog?.workoutExerciseLogs !=
          current.workoutLog?.workoutExerciseLogs,
      builder: (context, state) {
        final logs = state.workoutLog!.workoutExerciseLogs;
        return Visibility(
          visible: logs.isNotEmpty,
          child: Column(
            children: [
              Header(text: context.locale.exercises),
              ...logs.map<Widget>(
                (exerciseLog) => ExerciseLogItem(
                  log: exerciseLog,
                  workoutId: state.workoutLog!.id,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
