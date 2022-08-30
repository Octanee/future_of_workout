import 'dart:math';

import 'package:flutter/material.dart';
import 'package:future_of_workout/models/fatigue.dart';
import 'package:future_of_workout/models/muscle.dart';
import 'package:future_of_workout/various/text_style.dart';

import '../../../models/body.dart';
import '../../../widgets/body_widget.dart';
import '../../../widgets/custom_card.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => CustomCard(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              getBody(constraints),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  width: constraints.maxWidth * 0.65,
                  child: Text(
                    'Workout name',
                    style: AppTextStyle.textStyleSemiBold16,
                    softWrap: true,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(BoxConstraints constraints) => Positioned(
        left: -90,
        height: 400,
        top: -20,
        width: constraints.maxWidth * 1.15,
        child: BodyWidget(
          isFront: Random().nextBool(),
          body: Body()
            ..updateMusclesFatique(
              updates: {
                Muscle.random(): Fatigue.random(),
                Muscle.random(): Fatigue.random(),
                Muscle.random(): Fatigue.random(),
                Muscle.random(): Fatigue.random(),
                Muscle.random(): Fatigue.random(),
                Muscle.random(): Fatigue.random(),
                Muscle.random(): Fatigue.random(),
                Muscle.random(): Fatigue.random(),
              },
            ),
        ),
      );
}
