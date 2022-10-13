import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/workout/workout_goals/workout_goals.dart';

class GoalsList extends StatelessWidget {
  const GoalsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutGoalsBloc, WorkoutGoalsState>(
      buildWhen: (previous, current) => previous.goals != current.goals,
      builder: (context, state) {
        final list = state.goals;
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          physics: const BouncingScrollPhysics(),
          children: list.map<Widget>((goal) => GoalItem(goal: goal)).toList(),
        );
      },
    );
  }
}
