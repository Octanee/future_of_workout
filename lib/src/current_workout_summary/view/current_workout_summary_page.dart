import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/widgets/app_scaffold.dart';

class CurrentWorkoutSummaryPage extends StatelessWidget {
  const CurrentWorkoutSummaryPage({super.key});

  static String name = 'summary';
  static String path = name;

  @override
  Widget build(BuildContext context) {
    return const CurrentWorkoutSummaryView();
  }
}

class CurrentWorkoutSummaryView extends StatelessWidget {
  const CurrentWorkoutSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<CurrentWorkoutBloc>().add(const CurrentWorkoutClear());

        return true;
      },
      child: const AppScaffold(
        title: 'Summary',
      ),
    );
  }
}
