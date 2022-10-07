import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class AddExerciseButton extends StatelessWidget {
  const AddExerciseButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: 'Add exercise',
      icon: const Icon(Icons.add),
      onTap: onTap,
    );
  }
}
