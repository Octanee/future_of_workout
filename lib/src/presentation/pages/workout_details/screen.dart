import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/extensions/extensions.dart';
import '../../../data/models/models.dart';
import '../../../data/providers/exercise_provider.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  WorkoutDetailsScreen({Key? key}) : super(key: key);

  final List<WorkoutExercise> workoutExercises = List.generate(
    6,
    (index) => WorkoutExercise(
      exercise: ExerciseProvider.exercises.random(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Name',
      hasFloatingActionButton: true,
      onPressedFloatingActionButton: () {},
      floatingActionButtonIcon: Icons.add,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            _getStartWorkoutButton(),
            _getList(),
          ],
        ),
      ),
    );
  }

  Expanded _getList() {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 16),
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: workoutExercises.length,
        itemBuilder: (context, index) => WorkoutExerciseItem(
          workoutExercise: workoutExercises[index],
        ),
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
