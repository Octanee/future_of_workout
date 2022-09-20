import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout_exercise/current_workout_exercise.dart';
import 'package:future_of_workout/src/current_workout_exercise/view/widgets/current_workout_exercise_series_item.dart';
import 'package:future_of_workout/src/logger.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:workout_repository/workout_repository.dart';

class CurrentWorkoutExercisePage extends StatelessWidget {
  const CurrentWorkoutExercisePage({
    super.key,
    required this.workoutId,
    required this.workoutExerciseId,
  });

  static String name = 'current-workout-exercise';
  static String path = '$name/:workoutExerciseId';

  final String workoutId;
  final String workoutExerciseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentWorkoutExerciseBloc(
        workoutRepository: context.read<WorkoutRepository>(),
      )..add(
          CurrentWorkoutExerciseLoading(
            workoutId: workoutId,
            workoutExerciseId: workoutExerciseId,
          ),
        ),
      child: const CurrentWorkoutExerciseView(),
    );
  }
}

class CurrentWorkoutExerciseView extends StatelessWidget {
  const CurrentWorkoutExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutExerciseBloc, CurrentWorkoutExerciseState>(
      builder: (context, state) {
        if (state.status == CurrentWorkoutExerciseStatus.loading) {
          return _buildLoading();
        } else if (state.status == CurrentWorkoutExerciseStatus.failure) {
          return _buildFailure();
        }
        return _buildContent(context, state);
      },
    );
  }

  Widget _buildLoading() {
    return const AppScaffold(
      body: AppLoading(),
    );
  }

  Widget _buildFailure() {
    return AppScaffold(
      body: Center(
        child: Text(
          'Something gone wrong...',
          style: AppTextStyle.semiBold20,
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    CurrentWorkoutExerciseState state,
  ) {
    final workoutExercise = state.workoutExercise!;
    return AppScaffold(
      title: workoutExercise.exercise.name,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        physics: const BouncingScrollPhysics(),
        children: [
          ..._buildList(state.exerciseSeries),
          const AddSeriesButton(),
        ],
      ),
    );
  }

  List<Widget> _buildList(Map<ExerciseSeries, bool> exerciseSeries) {
    final list = <Widget>[];

    exerciseSeries.forEach(
      (key, value) => list.add(
        CurrentWorkoutExerciseSeriesItem(
          exerciseSeries: key,
          isFinished: value,
          index: list.length + 1,
          onTap: () {
            logger.i('CurrentWorkoutExerciseSeriesItem TAP');
          },
        ),
      ),
    );

    return list;
  }
}
