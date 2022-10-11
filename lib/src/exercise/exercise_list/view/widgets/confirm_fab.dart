import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:go_router/go_router.dart';

class ConfirmFab extends StatelessWidget {
  const ConfirmFab({required this.onConfirm, super.key});

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseListBloc, ExerciseListState>(
      builder: (context, state) {
        final lenght = state.selected.values.where((element) => element).length;

        if (state.multiSelected) {
          return FloatingActionButton.extended(
            label: Text(
              'Add $lenght exercises',
              style: AppTextStyle.semiBold16,
            ),
            onPressed: () {
              onConfirm();
              context.pop();
            },
          );
        } else {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              onConfirm();
              context.pop();
            },
          );
        }
      },
    );
  }
}
