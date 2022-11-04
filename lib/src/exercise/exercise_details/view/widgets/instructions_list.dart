// ignore_for_file: lines_longer_than_80_chars

import 'package:exercise_repository/exercise_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/exercise/exercise_details/view/widgets/widgets.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class InststuctionsList extends StatelessWidget {
  const InststuctionsList({
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    super.key,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseDetailsBloc, ExerciseDetailsState>(
      buildWhen: (previous, current) => previous.exercise != current.exercise,
      builder: (context, state) {
        final repository = context.read<ExerciseRepository>();

        if (repository.instructions == null) {
          final locale = Localizations.localeOf(context);
          repository.initInstructions(languageCode: locale.languageCode);
        }

        final list = repository.getInstructions(id: state.exercise!.id);

        return Visibility(
          visible: list.isNotEmpty,
          child: Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Header(text: 'Instructions'),
                ...list.map((text) => InstructionItem(text: text)).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
