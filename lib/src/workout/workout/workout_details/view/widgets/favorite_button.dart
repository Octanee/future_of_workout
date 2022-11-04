import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
      buildWhen: (previous, current) =>
          previous.workout?.isFavorite != current.workout?.isFavorite,
      builder: (context, state) {
        final isFavorite = state.workout!.isFavorite;
        final iconData = isFavorite ? AppIcons.heartFilled : AppIcons.heart;
        final color = isFavorite ? AppColors.yellow : null;

        return IconButton(
          onPressed: () => context
              .read<WorkoutDetailsBloc>()
              .add(const WorkoutDetailsFavoritToggled()),
          icon: AppIcon(
            iconData: iconData,
            color: color,
            height: 48,
            widht: 48,
          ),
        );
      },
    );
  }
}
