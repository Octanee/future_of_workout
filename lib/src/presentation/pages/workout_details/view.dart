import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../logic/state_management/state_management.dart';
import '../../styles/styles.dart';
import '../../widgets/widgets.dart';
import '../workout_exercises_list/page.dart';
import 'widgets/widgets.dart';

class WorkoutDetailsView extends StatelessWidget {
  const WorkoutDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkoutDetailsBloc, WorkoutDetailsState>(
      listener: (context, state) {
        if (state.status == WorkoutDetailsStatus.delete) {
          context.pop();
        }
      },
      child: AppScaffold(
        title: context.watch<WorkoutDetailsBloc>().state.workout.name,
        hasFloatingActionButton: true,
        onPressedFloatingActionButton: () {
          final workout = context.read<WorkoutDetailsBloc>().state.workout;
          context.goNamed(WorkoutExercisesListPage.name,
              params: {'id': workout.id}, extra: workout);
        },
        floatingActionButtonIcon: Icons.add,
        actions: _getActions(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              _getStartWorkoutButton(),
              _getList(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => context
            .read<WorkoutDetailsBloc>()
            .add(const WorkoutDetailsIsFavoritToggled()),
        icon: _getFavoritIcon(context),
      ),
      PopupMenuButton(
        itemBuilder: (context) => [
          _getPopumMenuItem(
            text: 'Rename',
            icon: Icons.edit,
            // TODO WorkoutDetails Name Changed
            onTap: () => context
                .read<WorkoutDetailsBloc>()
                .add(const WorkoutDetailsNameChanged(name: 'Test')),
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

  Widget _getFavoritIcon(BuildContext context) {
    return BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
      builder: (context, state) {
        if (state.workout.isFavorite) {
          return const Icon(Icons.star, color: AppColors.yellow);
        } else {
          return const Icon(Icons.star_border, color: AppColors.grey);
        }
      },
    );
  }

  Widget _getList() {
    return Expanded(
      child: BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
        builder: (context, state) {
          final workoutExercises = state.workout.workoutExercises;
          return ListView.separated(
            padding: const EdgeInsets.only(top: 16),
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            physics: const BouncingScrollPhysics(),
            itemCount: workoutExercises.length,
            itemBuilder: (context, index) => WorkoutExerciseItem(
              workoutExercise: workoutExercises[index],
            ),
          );
        },
      ),
    );
  }

  Widget _getStartWorkoutButton() {
    return BarButton(
      text: 'Start workout',
      icon: Icons.play_arrow_outlined,
      onTap: () => log('Start workout'),
    );
  }
}
