import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/settings/settings.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:user_repository/user_repository.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({super.key});

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
                  return EnumDialog<Gender>(
                    values: {
                      for (var gender in Gender.values) gender: gender.name
                    },
                    title: 'Select gender',
                    selected: user.gender,
                    onConfirm: (value) => bloc.add(
                      SettingsChangeData(user: user.copyWith(gender: value)),
                    ),
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gender',
                  style: AppTextStyle.bold24,
                ),
                Text(
                  user.gender.name,
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
