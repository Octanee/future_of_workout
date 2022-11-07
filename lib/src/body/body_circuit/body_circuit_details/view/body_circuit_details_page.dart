import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:measurement_repository/measurement_repository.dart';

class BodyCircuitDetailsPage extends StatelessWidget {
  const BodyCircuitDetailsPage({required this.measurementPlace, super.key});

  static String name = 'body-circuit-details';
  static String path = '$name/:measurementPlace';

  final String measurementPlace;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BodyCircuitDetailsBloc(
        measurementRepository: context.read<MeasurementRepository>(),
      )..add(BodyCircuitDetailsLoading(name: measurementPlace)),
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
              title:
                  context.locale.measurementPlace(state.measurementPlace!.name),
              body: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                physics: const BouncingScrollPhysics(),
                children: const [
                  DataPeriodBar(),
                  CircuitChart(),
                  CircuitPlaceList(),
                ],
              ),
            );
        }
      },
    );
  }
}
