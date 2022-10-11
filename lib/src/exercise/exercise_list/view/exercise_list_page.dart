import 'package:exercise_repository/exercise_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class ExerciseListPage extends StatelessWidget {
  const ExerciseListPage({required this.extra, super.key});

  final ExerciseListExtra extra;

  static String name = '/exercise-list';
  static String path = name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseListBloc(
        exerciseRepository: context.read<ExerciseRepository>(),
        multiSelected: extra.multiSelected,
      )..add(const ExerciseListSubscriptionRequested()),
      child: ExerciseListView(onConfirm: extra.onConfirm),
    );
  }
}

class ExerciseListView extends StatelessWidget {
  const ExerciseListView({super.key, required this.onConfirm});

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseListBloc, ExerciseListState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case ExerciseListStatus.failure:
            return const AppScaffold(body: AppError());
          case ExerciseListStatus.initial:
          case ExerciseListStatus.loading:
            return const AppScaffold(body: AppLoading());
          case ExerciseListStatus.success:
            return AppScaffold(
              title: 'Exercises',
              floatingActionButton: ConfirmFab(onConfirm: onConfirm),
              body: const ExerciseList(),
            );
        }
      },
    );
  }
}
