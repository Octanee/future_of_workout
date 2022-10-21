import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/settings/settings.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/bold_text.dart';
import 'package:future_of_workout/src/widgets/cards/cards.dart';

class HeightCard extends StatelessWidget {
  const HeightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.user?.height != current.user?.height,
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
                  'Height',
                  style: AppTextStyle.bold24,
                ),
                BoldText(
                  boldText: '${state.user?.height ?? '?'}',
                  mediumText: state.user?.lengthUnit.sufix ?? '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
