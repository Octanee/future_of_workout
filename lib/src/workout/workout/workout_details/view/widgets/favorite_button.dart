import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/workout/workout.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
      buildWhen: (previous, current) =>
          previous.workout?.isFavorite != current.workout?.isFavorite,
      builder: (context, state) {
        return IconButton(
          onPressed: () => context
              .read<WorkoutDetailsBloc>()
              .add(const WorkoutDetailsFavoritToggled()),
          icon: state.workout!.isFavorite
              ? const Icon(Icons.star, color: AppColors.yellow)
              : const Icon(Icons.star_border, color: AppColors.grey),
        );
      },
    );
  }
}
