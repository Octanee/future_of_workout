import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class DataList extends StatelessWidget {
  const DataList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseStatsBloc, ExerciseStatsState>(
      buildWhen: (previous, current) => previous.data != current.data,
      builder: (context, state) {
        if (state.data.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: AppEmptyList(
              text: 'The exercise has not yet been performed.',
            ),
          );
        }

        return ListView(
          shrinkWrap: true,
          children: const [
            DataPeriod(),
            ChartTypeBar(),
            WeightChart(),
            LogsList(),
          ],
        );
      },
    );
  }
}
