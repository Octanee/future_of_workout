import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/logger.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout_exercise_details/workout_exercise_details.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutExerciseDetailsPage extends StatelessWidget {
  const WorkoutExerciseDetailsPage({
    required this.workoutId,
    required this.workoutExerciseId,
    super.key,
  });

  static String name = 'workout-exercise-details';
  static String path = '$name/:workoutExerciseId';

  final String workoutId;
  final String workoutExerciseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutExerciseDetailsBloc(
        workoutRepository: context.read<WorkoutRepository>(),
      )..add(
          WorkoutExerciseDetailsLoading(
            workoutId: workoutId,
            workoutExerciseId: workoutExerciseId,
          ),
        ),
      child: const WorkoutExerciseDetailsView(),
    );
  }
}

class WorkoutExerciseDetailsView extends StatelessWidget {
  const WorkoutExerciseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutExerciseDetailsBloc,
        WorkoutExerciseDetailsState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == WorkoutExerciseDetailsStatus.delete) {
          context.pop();
        } else if (state.status == WorkoutExerciseDetailsStatus.updated) {
          context.pop();
        }
      },
      builder: (context, state) {
        if (state.status == WorkoutExerciseDetailsStatus.loading) {
          return _buildLoading();
        } else if (state.status == WorkoutExerciseDetailsStatus.failure) {
          return _buildFailure();
        }
        return _buildContent(state, context);
      },
    );
  }

  Widget _buildFailure() {
    return AppScaffold(
      body: Center(
        child: Text(
          'Something gone wront...',
          style: AppTextStyle.semiBold20,
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const AppScaffold(
      body: AppLoading(),
    );
  }

  Widget _buildContent(
    WorkoutExerciseDetailsState state,
    BuildContext context,
  ) {
    return AppScaffold(
      title: state.workoutExercise!.exercise.name,
      actions: _getActions(context),
      floatingActionButton:
          state.isEditing ? _buildFAB(context, state.status) : null,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        physics: const BouncingScrollPhysics(),
        children: [
          _buildAddExerciseSeriesButton(context),
          if (state.workoutExercise!.exerciseSeries.isNotEmpty)
            ...state.isAdvanced
                ? _buildAdvanced(
                    context,
                    series: state.workoutExercise!.exerciseSeries,
                  )
                : _buildItem(
                    context,
                    series: state.workoutExercise!.exerciseSeries,
                  ),
          if (state.workoutExercise!.exerciseSeries.isNotEmpty)
            _buildChangeDisplayModeButton(context, state.isAdvanced)
        ],
      ),
    );
  }

  List<Widget> _getActions(BuildContext context) {
    return [];
  }

  Widget _buildAddExerciseSeriesButton(BuildContext context) {
    return BarButton(
      text: 'Add series',
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
      icon: const Icon(Icons.add),
      onTap: () {
        context
            .read<WorkoutExerciseDetailsBloc>()
            .add(const WorkoutExerciseDetailsAddingSeries());
      },
    );
  }

  Widget _buildChangeDisplayModeButton(BuildContext context, bool isAdvanced) {
    return BarButton(
      text: isAdvanced ? 'Show simple' : 'Show advanced',
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
      icon: const Icon(Icons.display_settings_rounded),
      onTap: () {
        context
            .read<WorkoutExerciseDetailsBloc>()
            .add(const WorkoutExerciseDetailsChangeDisplayMode());
      },
    );
  }

  Widget _buildFAB(BuildContext context, WorkoutExerciseDetailsStatus status) {
    return FloatingActionButton(
      onPressed: () => context
          .read<WorkoutExerciseDetailsBloc>()
          .add(const WorkoutExerciseDetailsUpdatetingWorkoutRequested()),
      child: status == WorkoutExerciseDetailsStatus.updating
          ? const CircularProgressIndicator()
          : const Icon(Icons.save_outlined),
    );
  }

  List<Widget> _buildAdvanced(
    BuildContext context, {
    required List<ExerciseSeries> series,
  }) {
    final list = <Widget>[];
    for (var i = 0; i < series.length; i++) {
      final item = series[i];
      list
        ..add(
          ExerciseSeriesItem(
            index: i + 1,
            weight: item.weight,
            reps: item.reps,
            onRepsChanged: (value) {
              final newSeries = item.copyWith(reps: value);

              context.read<WorkoutExerciseDetailsBloc>().add(
                    WorkoutExerciseDetailsExerciseSeriesChanged(
                      series: newSeries,
                      index: i,
                    ),
                  );
            },
            onWeightChanged: (value) {
              final newSeries = item.copyWith(weight: value);

              context.read<WorkoutExerciseDetailsBloc>().add(
                    WorkoutExerciseDetailsExerciseSeriesChanged(
                      series: newSeries,
                      index: i,
                    ),
                  );
            },
          ),
        )
        ..add(
          RestExerciseSeries(
            rest: item.rest,
            onValueChanged: (value) {
              final rest = value.isNotEmpty ? int.parse(value) : 0;
              logger.d('${i + 1} Rest: $rest');
              final newSeries = item.copyWith(rest: rest);
              context.read<WorkoutExerciseDetailsBloc>().add(
                    WorkoutExerciseDetailsExerciseSeriesChanged(
                      index: i,
                      series: newSeries,
                    ),
                  );
            },
          ),
        );
    }
    return list;
  }

  List<Widget> _buildItem(
    BuildContext context, {
    required List<ExerciseSeries> series,
  }) {
    final item = series.first;

    return [
      ExerciseSeriesItem(
        index: series.length,
        weight: item.weight,
        reps: item.reps,
        onRepsChanged: (value) {
          final newSeries = item.copyWith(reps: value);

          context.read<WorkoutExerciseDetailsBloc>().add(
                WorkoutExerciseDetailsAllExerciseSeriesChanged(
                  series: newSeries,
                ),
              );
        },
        onWeightChanged: (value) {
          final newSeries = item.copyWith(weight: value);

          context.read<WorkoutExerciseDetailsBloc>().add(
                WorkoutExerciseDetailsAllExerciseSeriesChanged(
                  series: newSeries,
                ),
              );
        },
      ),
      RestExerciseSeries(
        rest: item.rest,
        onValueChanged: (value) {
          final rest = value.isNotEmpty ? int.parse(value) : 0;
          final newSeries = item.copyWith(rest: rest);
          context.read<WorkoutExerciseDetailsBloc>().add(
                WorkoutExerciseDetailsAllExerciseSeriesChanged(
                  series: newSeries,
                ),
              );
        },
      ),
    ];
  }
}
