import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/styles/app_colors.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class CurrentWorkoutFab extends StatelessWidget {
  const CurrentWorkoutFab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      buildWhen: (previous, current) => previous.item != current.item,
      builder: (context, state) {
        final isSelected = state.item == HomeNavigationItem.currentWorkout;

        return FloatingActionButton(
          heroTag: 'homeNavigationItem_currentWorkout_floatingActionButton',
          backgroundColor: isSelected ? AppColors.yellow : AppColors.grey,
          child: AppIcon(
          iconData:   HomeNavigationItem.currentWorkout.icon,
            color: isSelected ? AppColors.grey : AppColors.yellow,
          ),
          onPressed: () => context
              .read<NavigationCubit>()
              .changeDestination(item: HomeNavigationItem.currentWorkout),
        );
      },
    );
  }
}
