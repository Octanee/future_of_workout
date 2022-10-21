import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/settings/settings.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class WeightUnitCard extends StatelessWidget {
  const WeightUnitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.user?.weightUnit != current.user?.weightUnit,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CustomCard(
            padding: const EdgeInsets.all(16),
            onTap: () {
              //TODO(Octane): Handle onTap
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weight unit',
                  style: AppTextStyle.bold24,
                ),
                Text(
                  state.user?.weightUnit.name ?? '?',
                  style: AppTextStyle.semiBold20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
