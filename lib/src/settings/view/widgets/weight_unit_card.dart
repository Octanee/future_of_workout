import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/settings/settings.dart';
import 'package:future_of_workout/src/shared/logger.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:user_repository/user_repository.dart';

class WeightUnitCard extends StatelessWidget {
  const WeightUnitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
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
                  return EnumDialog<WeightUnit>(
                    values: {
                      for (var unit in WeightUnit.values) unit: unit.name
                    },
                    title: 'Select weight unit',
                    selected: user.weightUnit,
                    onConfirm: (value) {
                      logger.d('Select weight unit: $value');
                      bloc.add(
                        SettingsChangeData(
                          user: user.copyWith(weightUnit: value),
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
                  'Weight unit',
                  style: AppTextStyle.bold24,
                ),
                Text(
                  user.weightUnit.name,
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
