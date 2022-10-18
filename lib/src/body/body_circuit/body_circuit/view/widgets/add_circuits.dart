import 'package:flutter/material.dart';
import 'package:future_of_workout/src/body/body/body.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';
import 'package:go_router/go_router.dart';
import 'package:local_storage_measurement_api/local_storage_measurement_api.dart';

class AddCircuits extends StatelessWidget {
  const AddCircuits({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        context.goNamed(
          BodyCircuitDetailsPage.name,
          params: {
            'homePageTab': BodyPage.name,
            'measurementKey': DateTime.now().toKey(),
          },
        );
      },
    );
  }
}
