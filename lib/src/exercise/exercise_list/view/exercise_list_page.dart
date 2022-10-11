import 'dart:math';

import 'package:exercise_repository/exercise_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

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
        extra: extra,
      )..add(const ExerciseListSubscriptionRequested()),
      child: const ExerciseListView(),
    );
  }
}

class ExerciseListView extends StatelessWidget {
  const ExerciseListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExerciseListBloc, ExerciseListState>(
      listener: (context, state) {
        if (state.status == ExerciseListStatus.confirm) {
          context.pop();
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case ExerciseListStatus.failure:
            return const AppScaffold(body: AppError());
          case ExerciseListStatus.initial:
          case ExerciseListStatus.loading:
            return const AppScaffold(body: AppLoading());
          case ExerciseListStatus.confirm:
          case ExerciseListStatus.success:
            return const AppScaffold(
              title: 'Exercises',
              floatingActionButton: ConfirmFab(),
              body: ExerciseList(),
            );
        }
      },
    );
  }
}
