import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_weight/body_weight.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:measurement_repository/measurement_repository.dart';
import 'package:user_repository/user_repository.dart';

class BodyWeightTab extends StatelessWidget {
  const BodyWeightTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BodyWeightBloc(
        measurementRepository: context.read<MeasurementRepository>(),
        userRepository: context.read<UserRepository>(),
      )..add(const BodyWeightLoading()),
      child: const BodyWeightView(),
    );
  }
}

class BodyWeightView extends StatelessWidget {
  const BodyWeightView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyWeightBloc, BodyWeightState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case BodyWeightStatus.initial:
          case BodyWeightStatus.loading:
            return const AppScaffold(body: AppLoading());
          case BodyWeightStatus.failure:
            return const AppScaffold(body: AppError());
          case BodyWeightStatus.success:
            return const AppScaffold(
              floatingActionButton: AddWeight(),
              body: WeightContent(),
            );
        }
      },
    );
  }
}
