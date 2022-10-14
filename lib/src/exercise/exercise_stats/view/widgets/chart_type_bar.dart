import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class ChartTypeBar extends StatelessWidget {
  const ChartTypeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ToggleBar(
        onChange: (index) {
          context.read<ExerciseStatsBloc>().add(
                ExerciseStatsChartTypeChange(
                  chartType: ChartType.values[index],
                ),
              );
        },
        tabs: ChartType.values
            .map<Tab>((period) => Tab(text: period.name))
            .toList(),
      ),
    );
  }
}
