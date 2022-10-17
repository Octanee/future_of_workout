import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_weight/body_weight.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class DataPeriod extends StatelessWidget {
  const DataPeriod({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: PeriodBar(
        onChange: (period) {
          context
              .read<BodyWeightBloc>()
              .add(BodyWeightPeriodChange(period: period));
        },
      ),
    );
  }
}
