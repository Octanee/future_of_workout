import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/app_loading.dart';
import 'package:future_of_workout/src/widgets/custom_card.dart';
import 'package:future_of_workout/src/workouts_logs/workouts_logs.dart';
import 'package:intl/intl.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

class WorkoutsLogsTab extends StatelessWidget {
  const WorkoutsLogsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutsLogsBloc(
        workoutLogRepository: context.read<WorkoutLogRepository>(),
      )..add(const WorkoutsLogsLoadingRequest()),
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
      body: BlocBuilder<WorkoutsLogsBloc, WorkoutsLogsState>(
        builder: (context, state) {
          switch (state.status) {
            case WorkoutsLogsStatus.initial:
            case WorkoutsLogsStatus.loading:
              return const AppLoading();
            case WorkoutsLogsStatus.failure:
              return Center(
                child: Text(
                  'Something gone wrong..',
                  style: AppTextStyle.semiBold20,
                ),
              );
            case WorkoutsLogsStatus.loaded:
              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                physics: const BouncingScrollPhysics(),
                itemCount: state.logs.length,
                itemBuilder: (context, index) => WorkoutLogItem(
                  log: state.logs[index],
                  isReverse: index.isOdd,
                  onTap: () {},
                ),
              );
          }
        },
      ),
    );
  }
}
