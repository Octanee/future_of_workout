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

        if(lenght <1) return Container();

        if (state.extra.multiSelected) {
          return FloatingActionButton.extended(
            label: Text(
              'Add $lenght exercises',
              style: AppTextStyle.semiBold16,
            ),
            onPressed: () {
              context.read<ExerciseListBloc>().add(const ExerciseListConfirm());
            },
          );
        } else {
          return FloatingActionButton(
            child: const Icon(Icons.repeat),
            onPressed: () {
              context.read<ExerciseListBloc>().add(const ExerciseListConfirm());
            },
          );
        }
      },
    );
  }
}
