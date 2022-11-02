import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

class CurrentWorkoutExercisePage extends StatelessWidget {
  const CurrentWorkoutExercisePage({
    required this.currentWorkoutExerciseId,
    super.key,
  });

  static String name = 'current-workout-exercise';
  static String path = '$name/:currentWorkoutExerciseId';
  static Map<String, String> params({required String workoutExerciseLog}) => {
        'homePageTab': CurrentWorkoutPage.name,
        'currentWorkoutExerciseId': workoutExerciseLog
      };

  final String currentWorkoutExerciseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentWorkoutExerciseBloc(
        workoutLogRepository: context.read<WorkoutLogRepository>(),
      )..add(
          CurrentWorkoutExerciseSubscriptionRequested(
            id: currentWorkoutExerciseId,
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
    return WillPopScope(
      onWillPop: () async {
        final isRest =
            context.read<CurrentWorkoutBloc>().state.restDuration != null;
        if (isRest) {
          ScaffoldMessenger.of(context)
            ..clearMaterialBanners()
            ..showMaterialBanner(_restBanner());
        }

        return true;
      },
      child:
          BlocConsumer<CurrentWorkoutExerciseBloc, CurrentWorkoutExerciseState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == CurrentWorkoutExerciseStatus.delete) {
            context.pop();
          }
        },
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          switch (state.status) {
            case CurrentWorkoutExerciseStatus.initial:
            case CurrentWorkoutExerciseStatus.loading:
              return const AppScaffold(body: AppLoading());
            case CurrentWorkoutExerciseStatus.failure:
              return const AppScaffold(body: AppError());
            case CurrentWorkoutExerciseStatus.loaded:
            case CurrentWorkoutExerciseStatus.updating:
            case CurrentWorkoutExerciseStatus.updated:
            case CurrentWorkoutExerciseStatus.delete:
              final exerciseLog = state.workoutExerciseLog!;
              return AppScaffold(
                title: exerciseLog.exercise.name,
                floatingActionButton: const FinishedFab(),
                body: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    _RestCard(),
                    SeriesList(),
                    AddSeries(),
                    RemoveSeries(),
                    AboutExercise(),
                    ReplaceExercise(),
                    DeleteExercise(),
                  ],
                ),
              );
          }
        },
      ),
    );
  }

  MaterialBanner _restBanner() {
    return MaterialBanner(
      backgroundColor: AppColors.white,
      leading: const AppIcon(iconData: AppIcons.stopwatch),
      content: BlocBuilder<CurrentWorkoutBloc, CurrentWorkoutState>(
        buildWhen: (previous, current) =>
            previous.restDuration != current.restDuration,
        builder: (context, state) {
          return BoldText(
            boldText: state.restDuration?.toString() ?? '0',
            mediumText: ' s',
          );
        },
      ),
      actions: [
        BlocBuilder<CurrentWorkoutBloc, CurrentWorkoutState>(
          buildWhen: (previous, current) =>
              previous.restDuration != current.restDuration,
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.maybeOf(context)?.hideCurrentMaterialBanner();
              },
              child: const Text('Stop'),
            );
          },
        )
      ],
    );
  }
}

class _RestCard extends StatelessWidget {
  const _RestCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutBloc, CurrentWorkoutState>(
      buildWhen: (previous, current) =>
          previous.restDuration != current.restDuration,
      builder: (context, state) {
        final workoutExerciseId = context
            .read<CurrentWorkoutExerciseBloc>()
            .state
            .workoutExerciseLog!
            .id;
        return Visibility(
          visible: state.restDuration != null &&
              state.workoutExerciseId == workoutExerciseId,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: CustomCard(
              onTap: () {
                context.goNamed(
                  CurrentWorkoutRestPage.name,
                  params: CurrentWorkoutRestPage.params(
                    workoutExerciseId: workoutExerciseId,
                  ),
                );
              },
              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
              child: Row(
                children: [
                  const AppIcon(iconData: AppIcons.stopwatch),
                  const SizedBox(width: 8),
                  BoldText(
                    boldText: state.restDuration?.toString() ?? '0',
                    mediumText: ' s',
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Stop'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
