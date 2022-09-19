import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/bloc/current_workout_bloc.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/styles/app_text_style.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout_list/view/view.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_repository/workout_repository.dart';

class CurrentWorkoutPage extends StatelessWidget {
  const CurrentWorkoutPage({required this.workoutId, super.key});

  static String name = '/current_workout';
  static String path = '$name/:workoutId';

  final String workoutId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentWorkoutBloc(
        workoutRepository: context.read<WorkoutRepository>(),
      )..add(CurrentWorkoutLoadingWorkout(id: workoutId)),
      child: const CurrentWorkoutView(),
    );
  }
}

class CurrentWorkoutView extends StatelessWidget {
  const CurrentWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await showDialog<bool>(
          context: context,
          builder: (builderContext) => ConfirmDialog(
            title: 'Finish workout?',
            content: Text(
              'Do you want to end your workout?',
              style: AppTextStyle.medium16,
            ),
            onConfirm: () => context.goNamed(
              HomePage.name,
              params: {'homePageTab': WorkoutsListTab.name},
            ),
          ),
        );
        return false;
      },
      child: const AppScaffold(
        title: 'Workout',
        body: Center(
          child: Text('Current workout'),
        ),
      ),
    );
  }
}
