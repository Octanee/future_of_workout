import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_weight/body_weight.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class WeightContent extends StatelessWidget {
  const WeightContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyWeightBloc, BodyWeightState>(
      buildWhen: (previous, current) =>
          previous.period != current.period ||
          previous.weights != current.weights,
      builder: (context, state) {
        if (state.weights.isEmpty) {
          return const AppEmptyList(
            text: 'Weight measurement has not yet been added.',
          );
        }

        return ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: const [
            DataPeriod(),
            WeightChart(),
            WeightsList(),
          ],
        );
      },
    );
  }
}
