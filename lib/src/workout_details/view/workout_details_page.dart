import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout_details/workout_details.dart';
import 'package:future_of_workout/src/workout_exercise_details/workout_exercise_details.dart';
import 'package:future_of_workout/src/workout_exercises_list/view/view.dart';
import 'package:future_of_workout/src/workouts/workouts.dart';
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
        )..add(WorkoutDetailsWorkoutSubscriptionRequested(id: workoutId));
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
    final workout = state.workout!;
    return AppScaffold(
      title: workout.name,
      actions: _getActions(context, workout.isFavorite),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        physics: const BouncingScrollPhysics(),
        children: [
          if (workout.workoutExercises.isNotEmpty)
            _getStartWorkoutButton(context, workout.id),
          ...workout.workoutExercises
              .map(
                (item) => WorkoutExerciseItem(
                  workoutExercise: item,
                  onTap: () => context.goNamed(
                    WorkoutExerciseDetailsPage.name,
                    params: {
                      'homePageTab': WorkoutsPage.name,
                      'workoutId': workout.id,
                      'workoutExerciseId': item.id,
                    },
                  ),
                ),
              )
              .toList(),
          _getAddWorkoutExerciseButton(context, workout.id),
          if (workout.workoutExercises.isEmpty) _getEmptyList(),
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
        itemBuilder: (builderContext) => [
          _renamePopupMenuItem(context),
          _deletePopupMenuItem(context),
        ],
      ),
    ];
  }

  PopupMenuItem<void> _deletePopupMenuItem(BuildContext context) {
    return PopupMenuItem<void>(
      onTap: () {
        final bloc = context.read<WorkoutDetailsBloc>();
        final name = bloc.state.workout!.name;

        Future.delayed(
          Duration.zero,
          () => showDialog<bool>(
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
                onConfirm: () => bloc.add(const WorkoutDetailsDelete()),
              );
            },
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Delete', style: AppTextStyle.medium16),
          const Icon(Icons.delete, color: AppColors.grey)
        ],
      ),
    );
  }

  PopupMenuItem<void> _renamePopupMenuItem(BuildContext context) {
    return PopupMenuItem<void>(
      onTap: () {
        final bloc = context.read<WorkoutDetailsBloc>();
        Future.delayed(
          Duration.zero,
          () => showDialog<String>(
            context: context,
            builder: (context) {
              return RenameWorkoutDialog(
                onConfirm: (value) =>
                    bloc.add(WorkoutDetailsRenameWorkout(name: value)),
              );
            },
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Rename', style: AppTextStyle.medium16),
          const Icon(Icons.edit, color: AppColors.grey)
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

  Widget _getStartWorkoutButton(BuildContext context, String workoutId) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: BarButton(
        text: 'Start workout',
        icon: const Icon(Icons.play_arrow_outlined),
        onTap: () {
          context
              .read<CurrentWorkoutBloc>()
              .add(CurrentWorkoutStartWorkout(id: workoutId));
          context.goNamed(
            HomePage.name,
            params: {'homePageTab': CurrentWorkoutPage.name},
          );
        },
      ),
    );
  }

  Widget _getAddWorkoutExerciseButton(BuildContext context, String workoutId) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: BarButton(
        text: 'Add exercise',
        icon: const Icon(Icons.add),
        onTap: () {
          context.pushNamed(
            WorkoutExercisesListPage.name,
            params: {
              'homePageTab': WorkoutsPage.name,
              'workoutId': workoutId,
            },
          );
        },
      ),
    );
  }
}
