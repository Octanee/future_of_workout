import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
import '../../../widgets/widgets.dart';

class ExerciseSeriesItem extends StatelessWidget {
  const ExerciseSeriesItem({required this.series, super.key});

  final ExerciseSeries series;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: CustomCard(
        padding: const EdgeInsets.all(8),
        child: Text(
          series.index.toString(),
        ),
      ),
    );
  }
}
