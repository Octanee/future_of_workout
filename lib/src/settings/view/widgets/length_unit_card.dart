import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/settings/settings.dart';
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
                    title: context.locale.selectlengthUnit,
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
                  context.locale.lengthUnit,
                  style: AppTextStyle.bold24,
                ),
                Text(
                  context.locale.lengthUnitType(user.lengthUnit.name),
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
