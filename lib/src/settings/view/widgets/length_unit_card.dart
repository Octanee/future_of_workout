import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/settings/settings.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:user_repository/user_repository.dart';

class LengthUnitCard extends StatelessWidget {
  const LengthUnitCard({super.key});

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
                  return EnumDialog<LengthUnit>(
                    values: {
                      for (var unit in LengthUnit.values) unit: unit.name
                    },
                    title: 'Select lenght unit',
                    selected: user.lengthUnit,
                    onConfirm: (value) => bloc.add(
                      SettingsChangeData(
                        user: user.copyWith(lengthUnit: value),
                      ),
                    ),
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Length unit',
                  style: AppTextStyle.bold24,
                ),
                Text(
                  user.lengthUnit.name,
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
