import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

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
        title: 'Summary',
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
                const Header(text: 'Exercises'),
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
