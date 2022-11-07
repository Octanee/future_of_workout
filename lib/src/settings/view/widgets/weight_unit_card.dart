import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/settings/settings.dart';
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
                      for (var unit in WeightUnit.values)
                        unit: context.locale.weightUnitType(unit.name)
                    },
                    title: context.locale.selectWeightUnit,
                    selected: user.weightUnit,
                    onConfirm: (value) {
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
                  context.locale.weightUnit,
                  style: AppTextStyle.bold24,
                ),
                Text(
                  context.locale.weightUnitType(user.weightUnit.name),
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
