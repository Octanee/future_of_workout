import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/settings/settings.dart';

class AgeCard extends StatelessWidget {
  const AgeCard({super.key});

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
                  return IntDialog(
                    title: context.locale.age,
                    value: user.age,
                    confirmButtonText: context.locale.save,
                    hintText: context.locale.age,
                    maxValue: 99,
                    onConfirm: (value) => bloc.add(
                      SettingsChangeData(user: user.copyWith(age: value)),
                    ),
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.locale.age,
                  style: AppTextStyle.bold24,
                ),
                Text(
                  '${user.age}',
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
