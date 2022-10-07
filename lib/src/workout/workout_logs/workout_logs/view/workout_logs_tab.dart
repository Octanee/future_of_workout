import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/app_loading.dart';
import 'package:future_of_workout/src/workout/workout.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

class WorkoutsLogsTab extends StatelessWidget {
  const WorkoutsLogsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutLogsBloc(
        workoutLogRepository: context.read<WorkoutLogRepository>(),
      )..add(const WorkoutLogsLoadingRequest()),
      child: const WorkoutsLogsView(),
    );
  }
}

class WorkoutsLogsView extends StatelessWidget {
  const WorkoutsLogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<WorkoutLogsBloc, WorkoutLogsState>(
        builder: (context, state) {
          switch (state.status) {
            case WorkoutLogsStatus.initial:
            case WorkoutLogsStatus.loading:
              return const AppLoading();
            case WorkoutLogsStatus.failure:
              return Center(
                child: Text(
                  'Something gone wrong..',
                  style: AppTextStyle.semiBold20,
                ),
              );
            case WorkoutLogsStatus.loaded:
              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                physics: const BouncingScrollPhysics(),
                itemCount: state.logs.length,
                itemBuilder: (context, index) {
                  final item = state.logs[index];
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
          }
        },
      ),
    );
  }
}
