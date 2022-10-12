import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';
import 'package:future_of_workout/src/workout/workouts/workouts.dart';
import 'package:go_router/go_router.dart';

class WorkoutLogsList extends StatelessWidget {
  const WorkoutLogsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutLogsBloc, WorkoutLogsState>(
      buildWhen: (previous, current) => previous.logs != current.logs,
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          physics: const BouncingScrollPhysics(),
          itemCount: state.logs.length,
          itemBuilder: (context, index) {
            final item = state.logs[index];

            if (item.endDate == null) return Container();
            
            return WorkoutLogItem(
              log: item,
              isReverse: index.isOdd,
              onTap: () {
                context.goNamed(
                  WorkoutLogsDetailsPage.name,
                  params: {
                    'homePageTab': WorkoutsPage.name,
                    'workoutLogId': item.id,
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
