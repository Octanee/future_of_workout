import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_weight/body_weight.dart';
import 'package:future_of_workout/src/shared/extensions.dart';

class AddWeight extends StatelessWidget {
  const AddWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        final bloc = context.read<BodyWeightBloc>();

        await showDialog<String>(
          context: context,
          builder: (context) => WeightDialog(
            onConfirm: (weight, date) {
              bloc.add(
                BodyWeightAdd(
                  weight: weight,
                  date: date.toDay(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
