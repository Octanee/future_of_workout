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
                  return NumberDialog<double>(
                    title: 'Change height',
                    value: user.height,
                    confirmButtonText: 'Save',
                    hintText: 'Height',
                    suffixText: user.lengthUnit.sufix,
                    onConfirm: (value) {
                      final height = user.lengthUnit == LengthUnit.centimeter
                          ? value
                          : UnitConverter.centimetersToInches(
                              length: value,
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
                  boldText: user.height.toString(),
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
