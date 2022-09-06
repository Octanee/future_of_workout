import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/models/models.dart';
import '../../../styles/app_text_style.dart';
import '../../../widgets/widgets.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({required this.exercise, super.key});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset(
                exercise.imagePathStart,
              ),
            ),
          ),
          Text(
            exercise.name,
            style: AppTextStyle.semiBold16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
