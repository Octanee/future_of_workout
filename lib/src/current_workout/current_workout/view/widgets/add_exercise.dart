import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class AddExercise extends StatelessWidget {
  const AddExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: 'Add exercise',
      icon: const Icon(Icons.add),
      onTap: () {},
    );
  }
}
