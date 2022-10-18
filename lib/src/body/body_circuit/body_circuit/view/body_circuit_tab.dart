import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:measurement_repository/measurement_repository.dart';

class BodyCircuitTab extends StatelessWidget {
  const BodyCircuitTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BodyCircuitBloc(
        measurementRepository: context.read<MeasurementRepository>(),
      )..add(const BodyCircuitLoading()),
      child: const BodyCircuitView(),
    );
  }
}

class BodyCircuitView extends StatelessWidget {
  const BodyCircuitView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyCircuitBloc, BodyCircuitState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case BodyCircuitStatus.initial:
          case BodyCircuitStatus.loading:
            return const AppScaffold(body: AppLoading());
          case BodyCircuitStatus.failure:
            return const AppScaffold(body: AppError());
          case BodyCircuitStatus.success:
            return const AppScaffold(
              floatingActionButton: AddCircuits(),
              body: CircuitsContent(),
            );
        }
      },
    );
  }
}
