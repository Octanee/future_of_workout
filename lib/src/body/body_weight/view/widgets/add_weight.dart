import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/body/body_weight/body_weight.dart';
import 'package:future_of_workout/src/shared/extensions.dart';
import 'package:future_of_workout/src/shared/unit_converter.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class AddWeight extends StatelessWidget {
  const AddWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const AppIcon(iconData: AppIcons.plus),
      onPressed: () async {
        final bloc = context.read<BodyWeightBloc>();
        final unit = context.read<AppBloc>().state.user!.weightUnit;

        await showDialog<String>(
          context: context,
          builder: (context) => WeightDialog(
            suffix: unit.sufix,
            onConfirm: (weight, date) {
              bloc.add(
                BodyWeightAdd(
                  weight: UnitConverter.dataWeight(unit: unit, value: weight),
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
