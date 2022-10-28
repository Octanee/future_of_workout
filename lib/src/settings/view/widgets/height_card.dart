import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/settings/settings.dart';
import 'package:future_of_workout/src/shared/unit_converter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:user_repository/user_repository.dart';

class HeightCard extends StatelessWidget {
  const HeightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.user?.height != current.user?.height ||
          previous.user?.lengthUnit != current.user?.lengthUnit,
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
                    title: 'Change height',
                    value: UnitConverter.dispalyedLength(
                      unit: user.lengthUnit,
                      value: user.height,
                    ),
                    confirmButtonText: 'Save',
                    hintText: 'Height',
                    suffixText: user.lengthUnit.sufix,
                    decimalPoint:
                        user.lengthUnit == LengthUnit.centimeter ? 1 : 2,
                    onConfirm: (value) {
                      final height = UnitConverter.dataLength(
                        unit: user.lengthUnit,
                        value: value,
                      );

                      bloc.add(
                        SettingsChangeData(user: user.copyWith(height: height)),
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
                  'Height',
                  style: AppTextStyle.bold24,
                ),
                BoldText(
                  boldText: UnitConverter.dispalyedLength(
                    unit: user.lengthUnit,
                    value: user.height,
                  ).toString(),
                  mediumText: user.lengthUnit.sufix,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
