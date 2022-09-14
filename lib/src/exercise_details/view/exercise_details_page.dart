import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/app_scaffold.dart';

class ExerciseDetailsPage extends StatelessWidget {
  const ExerciseDetailsPage({required this.exerciseId, super.key});

  final String exerciseId;

  static String name = '/exercise-details';
  static String path = '$name/:exerciseId';

  @override
  Widget build(BuildContext context) {
    return const AppScaffold();
  }
}
