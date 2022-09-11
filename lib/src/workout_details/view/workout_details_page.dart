import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/styles/app_text_style.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout_details/workout_details.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutDetailsPage extends StatelessWidget {
  const WorkoutDetailsPage({
    required this.workoutId,
    super.key,
  });

  static String name = 'workout-details';
  static String path = '$name/:workoutId';

  final String workoutId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutDetailsBloc>(
      create: (context) {
        final repository = context.read<WorkoutRepository>();

        return WorkoutDetailsBloc(
          workoutRepository: repository,
        )..add(WorkoutDetailsLoadWorkout(id: workoutId));
      },
      child: const WorkoutDetailsView(),
    );
  }
}

class WorkoutDetailsView extends StatelessWidget {
  const WorkoutDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutDetailsBloc, WorkoutDetailsState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == WorkoutDetailsStatus.delete) {
          context.pop();
        }
      },
      builder: (context, state) {
        if (state.status == WorkoutDetailsStatus.loading) {
          return _buildLoading();
        } else if (state.status == WorkoutDetailsStatus.failure) {
          return _buildFailure();
        }
        return _buildContent(state, context);
      },
    );
  }

  Widget _buildContent(WorkoutDetailsState state, BuildContext context) {
    return AppScaffold(
      title: state.workout!.name,
      actions: _getActions(context, state.workout!.isFavorite),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          if (state.workout!.workoutExercises.isNotEmpty)
            _getStartWorkoutButton(),
          ...state.workout!.workoutExercises
              .map((item) => WorkoutExerciseItem(workoutExercise: item))
              .toList(),
          _getAddWorkoutExerciseButton(),
          if (state.workout!.workoutExercises.isEmpty) _getEmptyList(),
        ],
      ),
    );
  }

  Widget _getEmptyList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 64),
      child: Center(
        child: Text(
          'Add some exercise to training.',
          style: AppTextStyle.semiBold20,
        ),
      ),
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

  List<Widget> _getActions(BuildContext context, bool isFavorite) {
    return [
      IconButton(
        onPressed: () => context
            .read<WorkoutDetailsBloc>()
            .add(const WorkoutDetailsFavoritToggled()),
        icon: _getFavoritIcon(isFavorite),
      ),
      PopupMenuButton(
        itemBuilder: (context) => [
          _getPopumMenuItem(
            text: 'Rename',
            icon: Icons.edit,
            onTap: () {
              // TODO(Octane): Handle Name Changed
            },
          ),
          _getPopumMenuItem(
            text: 'Delete',
            icon: Icons.delete,
            onTap: () => context
                .read<WorkoutDetailsBloc>()
                .add(const WorkoutDetailsDelete()),
          ),
        ],
      ),
    ];
  }

  PopupMenuItem<dynamic> _getPopumMenuItem({
    required String text,
    required IconData icon,
    required void Function()? onTap,
  }) {
    return PopupMenuItem(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: AppTextStyle.medium16),
          Icon(icon, color: AppColors.grey)
        ],
      ),
    );
  }

  Widget _getFavoritIcon(bool isFavorite) {
    if (isFavorite) {
      return const Icon(Icons.star, color: AppColors.yellow);
    } else {
      return const Icon(Icons.star_border, color: AppColors.grey);
    }
  }

  Widget _getStartWorkoutButton() {
    return BarButton(
      text: 'Start workout',
      icon: const Icon(Icons.play_arrow_outlined),
      onTap: () {
        // TODO(Octane): Start workout
        log('Start workout');
      },
    );
  }

  Widget _getAddWorkoutExerciseButton() {
    return BarButton(
      text: 'Add exercise',
      icon: const Icon(Icons.add),
      onTap: () {
        // TODO(Octane): Navigate to List of Exercises
      },
    );
  }
}
