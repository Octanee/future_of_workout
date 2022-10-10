import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
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
    return WillPopScope(
      onWillPop: () async {
        context
            .read<WorkoutExerciseDetailsBloc>()
            .add(const WorkoutExerciseDetailsUpdatetingWorkoutRequested());
        return true;
      },
      child: AppScaffold(
        title: state.workoutExercise!.exercise.name,
        actions: _getActions(context),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          physics: const BouncingScrollPhysics(),
          children: [
            _buildAddExerciseSeriesButton(context),
            if (state.workoutExercise!.exerciseSeries.isNotEmpty) ...[
              _buildRemoveExerciseSeriesButton(context),
              ...state.isAdvanced
                  ? _buildAdvanced(
                      context,
                      series: state.workoutExercise!.exerciseSeries,
                    )
                  : _buildSimple(
                      context,
                      series: state.workoutExercise!.exerciseSeries,
                    ),
              //_buildChangeDisplayModeButton(context, state.isAdvanced),
            ],
            _buildExerciseInfoButton(
              context,
              state.workoutExercise!.exercise.id,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.repeat),
      ),
      IconButton(
        onPressed: () async {
          final bloc = context.read<WorkoutExerciseDetailsBloc>();
          final name = bloc.state.workoutExercise!.exercise.name;

          await showDialog<bool>(
            context: context,
            builder: (context) {
              return ConfirmDialog(
                title: 'Delete?',
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Are you sure you want to delete:',
                      style: AppTextStyle.medium16,
                    ),
                    Text(
                      name,
                      style: AppTextStyle.semiBold16,
                    ),
                  ],
                ),
                onConfirm: () => bloc
                    .add(const WorkoutExerciseDetailsDeleteWorkoutExercise()),
              );
            },
          );
        },
        icon: const Icon(Icons.delete_outline),
      ),
    ];
  }

  Widget _buildAddExerciseSeriesButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: BarButton(
        text: 'Add series',
        icon: const Icon(Icons.add),
        onTap: () {
          context
              .read<WorkoutExerciseDetailsBloc>()
              .add(const WorkoutExerciseDetailsAddingSeries());
        },
      ),
    );
  }

  // Widget _buildChangeDisplayModeButton(
  //   BuildContext context,
  //   bool isAdvanced,
  // ) {
  //   return BarButton(
  //     text: isAdvanced ? 'Simple' : 'Advanced',
  //     padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
  //     icon: const Icon(Icons.list),
  //     onTap: () {
  //       context
  //           .read<WorkoutExerciseDetailsBloc>()
  //           .add(const WorkoutExerciseDetailsChangeDisplayMode());
  //     },
  //   );
  // }

  Widget _buildRemoveExerciseSeriesButton(BuildContext context) {
    return BarButton(
      text: 'Remove series',
      padding: const EdgeInsets.only(bottom: 16),
      icon: const Icon(Icons.remove),
      onTap: () {
        context
            .read<WorkoutExerciseDetailsBloc>()
            .add(const WorkoutExerciseDetailsRemovedSeries());
      },
    );
  }

  Widget _buildExerciseInfoButton(BuildContext context, String exerciseId) {
    return BarButton(
      text: 'About exercise',
      padding: const EdgeInsets.only(top: 8),
      icon: const Icon(Icons.info_outline_rounded),
      onTap: () {
        context.pushNamed(
          ExerciseDetailsPage.name,
          params: {'exerciseId': exerciseId},
        );
      },
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
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: ExerciseSeriesItem(
              index: i + 1,
              weight: item.weight,
              reps: item.reps,
              onTap: () async {
                final bloc = context.read<WorkoutExerciseDetailsBloc>();

                await showDialog<String>(
                  context: context,
                  builder: (context) {
                    return SeriesEditDialog(
                      title: 'Change ${i + 1} series',
                      reps: item.reps.toString(),
                      weight: item.weight.toString(),
                      onConfirm: (int reps, double weight) {
                        final newSeries =
                            item.copyWith(reps: reps, weight: weight);
                        bloc.add(
                          WorkoutExerciseDetailsExerciseSeriesChanged(
                            index: i,
                            series: newSeries,
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        )
        ..add(
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: RestExerciseSeries(
              rest: item.rest,
              onTap: () async {
                final bloc = context.read<WorkoutExerciseDetailsBloc>();

                await showDialog<String>(
                  context: context,
                  builder: (context) {
                    return RestEditDialog(
                      title: 'Change ${i + 1} REST',
                      rest: item.rest.toString(),
                      onPositive: (rest) {
                        final newSeries = item.copyWith(rest: rest);
                        bloc.add(
                          WorkoutExerciseDetailsExerciseSeriesChanged(
                            index: i,
                            series: newSeries,
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        );
    }
    return list;
  }

  List<Widget> _buildSimple(
    BuildContext context, {
    required List<ExerciseSeries> series,
  }) {
    final item = series.first;

    return [
      ExerciseSeriesItem(
        index: series.length,
        weight: item.weight,
        reps: item.reps,
        onTap: () async {
          final bloc = context.read<WorkoutExerciseDetailsBloc>();

          await showDialog<String>(
            context: context,
            builder: (context) {
              return SeriesEditDialog(
                reps: item.reps.toString(),
                weight: item.weight.toString(),
                onConfirm: (int reps, double weight) {
                  final newSeries = item.copyWith(reps: reps, weight: weight);
                  bloc.add(
                    WorkoutExerciseDetailsAllExerciseSeriesChanged(
                      series: newSeries,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      RestExerciseSeries(
        rest: item.rest,
        onTap: () async {
          final bloc = context.read<WorkoutExerciseDetailsBloc>();

          await showDialog<String>(
            context: context,
            builder: (context) {
              return RestEditDialog(
                rest: item.rest.toString(),
                onPositive: (rest) {
                  final newSeries = item.copyWith(rest: rest);
                  bloc.add(
                    WorkoutExerciseDetailsAllExerciseSeriesChanged(
                      series: newSeries,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    ];
  }
}