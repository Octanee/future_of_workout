import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class ConfirmFab extends StatelessWidget {
  const ConfirmFab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseListBloc, ExerciseListState>(
      builder: (context, state) {
        final lenght = state.selected.values.where((element) => element).length;

        if (lenght < 1) {
          return Container();
        }

        switch (state.extra.selectionType) {
          case SelectionType.none:
            return Container();
          case SelectionType.single:
            return FloatingActionButton(
              child: state.extra.icon,
              onPressed: () {
                context
                    .read<ExerciseListBloc>()
                    .add(const ExerciseListConfirm());
              },
            );
          case SelectionType.multiple:
            return FloatingActionButton.extended(
              label: Text(
                'Add $lenght exercises',
                style: AppTextStyle.semiBold16,
              ),
              onPressed: () {
                context
                    .read<ExerciseListBloc>()
                    .add(const ExerciseListConfirm());
              },
            );
        }
      },
    );
  }
}
