import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_recovery/body_recovery.dart';
import 'package:future_of_workout/src/body/body_recovery/view/widgets/widgets.dart';
import 'package:future_of_workout/src/widgets/app_scaffold.dart';
import 'package:future_of_workout/src/widgets/states/app_error.dart';
import 'package:future_of_workout/src/widgets/states/app_loading.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

class BodyRecoveryTab extends StatelessWidget {
  const BodyRecoveryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BodyRecoveryBloc(
        workoutLogRepository: context.read<WorkoutLogRepository>(),
      )..add(const BodyRecoveryLoading()),
      child: const BodyRecoveryView(),
    );
  }
}

class BodyRecoveryView extends StatelessWidget {
  const BodyRecoveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyRecoveryBloc, BodyRecoveryState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case BodyRecoveryStatus.initial:
          case BodyRecoveryStatus.loading:
            return const AppScaffold(body: AppLoading());
          case BodyRecoveryStatus.failure:
            return const AppScaffold(body: AppError());
          case BodyRecoveryStatus.success:
            return AppScaffold(
              body: ListView(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: const [
                  BodyPositionBar(),
                  BodyCard(),
                  RecoveryStats(),
                ],
              ),
            );
        }
      },
    );
  }
}
