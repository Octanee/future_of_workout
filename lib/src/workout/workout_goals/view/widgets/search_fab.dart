import 'package:flutter/material.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:go_router/go_router.dart';

class SearchFab extends StatelessWidget {
  const SearchFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.pushNamed(
          ExerciseListPage.name,
          extra: ExerciseListExtra(
            selectionType: SelectionType.none,
          ),
        );
      },
      child: const Icon(Icons.search_rounded),
    );
  }
}
