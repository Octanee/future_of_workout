import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:local_storage_measurement_api/local_storage_measurement_api.dart';
import 'package:measurement_repository/measurement_repository.dart';

class BodyCircuitAddPage extends StatelessWidget {
  const BodyCircuitAddPage({required this.measurementKey, super.key});

  static String name = 'body-circuit-add';
  static String path = '$name/:measurementKey';

  final String measurementKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BodyCircuitAddBloc(
        measurementRepository: context.read<MeasurementRepository>(),
      )..add(BodyCircuitAddLoading(dateTime: measurementKey.toDateTime())),
      child: const BodyCircuitAddView(),
    );
  }
}

class BodyCircuitAddView extends StatelessWidget {
  const BodyCircuitAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .read<BodyCircuitAddBloc>()
            .add(const BodyCircuitAddPop());
        return true;
      },
      child: AppScaffold(
        title: 'Circuits',
        body: BlocBuilder<BodyCircuitAddBloc, BodyCircuitAddState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            switch (state.status) {
              case BodyCircuitDetailsStatus.initial:
              case BodyCircuitDetailsStatus.loading:
                return const AppLoading();
              case BodyCircuitDetailsStatus.failure:
                return const AppError();
              case BodyCircuitDetailsStatus.success:
                return ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    DateCard(),
                    Header(text: 'Circuits'),
                    CircuitsList(),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
