import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseListBloc, ExerciseListState>(
      buildWhen: (previous, current) => previous.selected != current.selected,
      builder: (context, state) {
        final list = state.exercises;
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          physics: const BouncingScrollPhysics(),
          children: list.map<Widget>((exercise) {
            final isSelected = state.selected[exercise] ?? false;
            return ExerciseItem(
              exercise: exercise,
              isSelected: isSelected,
              onTap: () {
                if (state.extra.selectionType == SelectionType.none) {
                  context.pushNamed(
                    ExerciseStatsPage.name,
                    params: {'exerciseId': exercise.id},
                  );
                } else {
                  context
                      .read<ExerciseListBloc>()
                      .add(ExerciseListSelect(exercise: exercise));
                }
              },
              onIconPressed: () {
                context.pushNamed(
                  ExerciseDetailsPage.name,
                  params: {'exerciseId': exercise.id},
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
