import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';

class CurrentWorkoutSummaryPage extends StatelessWidget {
  const CurrentWorkoutSummaryPage({super.key});

  static String name = 'summary';
  static String path = name;

  @override
  Widget build(BuildContext context) {
    return const CurrentWorkoutSummaryView();
  }
}

class CurrentWorkoutSummaryView extends StatelessWidget {
  const CurrentWorkoutSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<CurrentWorkoutBloc>().add(const CurrentWorkoutClear());

        return false;
      },
      child: AppScaffold(
        title: context.local.summary,
        body: BlocBuilder<CurrentWorkoutBloc, CurrentWorkoutState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            if (state.workoutLog == null) {
              return const AppLoading();
            }
            final log = state.workoutLog!;

            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              physics: const BouncingScrollPhysics(),
              children: [
                WorkoutSummaryCard(workoutLog: log),
                Header(text: context.local.exercises),
                ...log.workoutExerciseLogs.map<Widget>(
                  (exerciseLog) => WorkoutExerciseLogDetailsItem(
                    header: WorkoutExerciseLogItem(
                      markCompleted: false,
                      workoutExerciseLog: exerciseLog,
                    ),
                    workoutExerciseLog: exerciseLog,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
