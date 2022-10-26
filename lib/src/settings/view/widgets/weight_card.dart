import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/settings/settings.dart';
import 'package:future_of_workout/src/shared/unit_converter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class WeightCard extends StatelessWidget {
  const WeightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.user?.weight != current.user?.weight ||
          previous.user?.weightUnit != current.user?.weightUnit,
      builder: (context, state) {
        final user = state.user!;

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CustomCard(
            padding: const EdgeInsets.all(16),
            onTap: () async {
              final bloc = context.read<SettingsBloc>();

              await showDialog<void>(
                context: context,
                builder: (context) {
                  return DoubleDialog(
                    title: 'Change weight',
                    value: UnitConverter.dispalyedWeight(
                      unit: user.weightUnit,
                      value: user.weight,
                    ),
                    confirmButtonText: 'Save',
                    hintText: 'Weight',
                    suffixText: user.weightUnit.sufix,
                    onConfirm: (value) {
                      final weight = UnitConverter.dataWeight(
                        unit: user.weightUnit,
                        value: value,
                      );

                      bloc.add(
                        SettingsChangeData(
                          user: user.copyWith(weight: weight),
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weight',
                  style: AppTextStyle.bold24,
                ),
                BoldText(
                  boldText: UnitConverter.dispalyedWeight(
                    unit: user.weightUnit,
                    value: user.weight,
                  ).toString(),
                  mediumText: user.weightUnit.sufix,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
