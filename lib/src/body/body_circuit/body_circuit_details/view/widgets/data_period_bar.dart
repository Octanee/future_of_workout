import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class DataPeriodBar extends StatelessWidget {
  const DataPeriodBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: PeriodBar(
        onChange: (period) {
          context
              .read<BodyCircuitDetailsBloc>()
              .add(BodyCircuitDetailsPeriodChange(period: period));
        },
      ),
    );
  }
}
