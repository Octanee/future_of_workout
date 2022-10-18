import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:local_storage_measurement_api/local_storage_measurement_api.dart';
import 'package:measurement_repository/measurement_repository.dart';

class BodyCircuitDetailsPage extends StatelessWidget {
  const BodyCircuitDetailsPage({required this.measurementKey, super.key});

  static String name = 'body-circuit-details';
  static String path = '$name/:measurementKey';

  final String measurementKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BodyCircuitDetailsBloc(
        measurementRepository: context.read<MeasurementRepository>(),
      )..add(BodyCircuitDetailsLoading(dateTime: measurementKey.toDateTime())),
      child: const BodyCircuitDetailsView(),
    );
  }
}

class BodyCircuitDetailsView extends StatelessWidget {
  const BodyCircuitDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyCircuitDetailsBloc, BodyCircuitDetailsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case BodyCircuitDetailsStatus.initial:
          case BodyCircuitDetailsStatus.loading:
            return const AppScaffold(body: AppLoading());
          case BodyCircuitDetailsStatus.failure:
            return const AppScaffold(body: AppError());
          case BodyCircuitDetailsStatus.success:
            return AppScaffold(
              title: 'Circuits',
              body: Container(),
            );
        }
      },
    );
  }
}
