import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/buttons/replace_button.dart';

class ReplaceExercise extends StatelessWidget {
  const ReplaceExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ReplaceButton(
        onTap: () {},
      ),
    );
  }
}
