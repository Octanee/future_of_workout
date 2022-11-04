// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/exercise/exercise_details/view/widgets/widgets.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class InststuctionsList extends StatelessWidget {
  const InststuctionsList({
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    super.key,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseDetailsBloc, ExerciseDetailsState>(
      builder: (context, state) {
        final list = [
          'Stand in an upright posture grabbing ahold of a barbell shoulder width apart with your palms facing away from your body just below waist height.',
          'Brace your core by breathing into your stomach and flexing your abdominal muscles as you begin to flex your elbows to raise the bar.',
          'Keep your elbows at your sides as you flex the barbell to shoulder height avoiding movement through your spine.',
          'Exhale and lower the barbell back to the starting position.',
        ];

        return Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(text: 'Instructions'),
              ...list.map((text) => InstructionItem(text: text)).toList(),
            ],
          ),
        );
      },
    );
  }
}
