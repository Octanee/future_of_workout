import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:future_of_workout/src/setup/setup.dart';
import 'package:future_of_workout/src/setup/view/widgets/widgets.dart';
import 'package:future_of_workout/src/styles/app_text_style.dart';
import 'package:future_of_workout/src/widgets/bold_text.dart';
import 'package:future_of_workout/src/widgets/cards/cards.dart';

class FinishSetup extends StatelessWidget {
  const FinishSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupBloc, SetupState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        final user = state.user;
        return SetupContent(
          title: 'Finish',
          description: '',
          children: [
            GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              children: [
                _DataRow(
                  text: 'Gender',
                  value: user.gender.name,
                ),
                _DataRow(
                  text: 'Age',
                  value: user.age.toString(),
                ),
                _DataRow(
                  text: 'Height',
                  value: user.height.toString(),
                  suffix: user.lengthUnit.sufix,
                ),
                _DataRow(
                  text: 'Weight',
                  value: user.weight.toString(),
                  suffix: user.weightUnit.sufix,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.text,
    required this.value,
    this.suffix = '',
  });

  final String text;
  final String value;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(text, style: AppTextStyle.semiBold24),
            BoldText(boldText: value, mediumText: suffix),
          ],
        ),
      ),
    );
  }
}
