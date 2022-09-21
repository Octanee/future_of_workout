import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/current_workout_exercise/current_workout_exercise.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout_list/workout_list.dart';
import 'package:go_router/go_router.dart';

class CurrentWorkoutPage extends StatelessWidget {
  const CurrentWorkoutPage({required this.workoutId, super.key});

  static String name = '/current_workout';
  static String path = '$name/:workoutId';

  final String workoutId;

  @override
  Widget build(BuildContext context) {
    return const CurrentWorkoutView();
  }
}

class CurrentWorkoutView extends StatelessWidget {
  const CurrentWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentWorkoutBloc, CurrentWorkoutState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == CurrentWorkoutStatus.finish) {
          context.goNamed(
            HomePage.name,
            params: {'homePageTab': WorkoutsListTab.name},
          );
        }
      },
      builder: (context, state) {
        if (state.status == CurrentWorkoutStatus.loading) {
          return _buildLoading();
        } else if (state.status == CurrentWorkoutStatus.failure) {
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

  Widget _buildContent(BuildContext context, CurrentWorkoutState state) {
    final workout = state.workout!;
    return AppScaffold(
      title: workout.name,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const FinishButton(),
          ..._buildList(context, state.exercises),
          AddExerciseButton(onTap: () {}),
        ],
      ),
    );
  }

  List<Widget> _buildList(
    BuildContext context,
    List<CurrentWorkoutExercise> exercises,
  ) {
    final list = exercises
        .map<Widget>(
          (exercise) => CurrentWorkoutExerciseItem(
            exercise: exercise,
            onTap: () {
              final bloc = context.read<CurrentWorkoutBloc>()
                ..add(CurrentWorkoutChangeExercise(exercise: exercise));
              context.goNamed(
                CurrentWorkoutExercisePage.name,
                params: {'workoutId': bloc.state.workout!.id},
              );
            },
          ),
        )
        .toList();

    return list;
  }
}
