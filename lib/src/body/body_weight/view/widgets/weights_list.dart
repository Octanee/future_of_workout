import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/body/body_weight/body_weight.dart';
import 'package:future_of_workout/src/shared/extensions.dart';
import 'package:future_of_workout/src/shared/unit_converter.dart';

class WeightsList extends StatelessWidget {
  const WeightsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyWeightBloc, BodyWeightState>(
      buildWhen: (previous, current) => previous.data != current.data,
      builder: (context, state) {
        final list = state.data;
        final unit = context.read<AppBloc>().state.user!.weightUnit;

        return Column(
          children: list
              .map<Widget>(
                (e) => WeightItem(
                  dateTime: e.key,
                  suffix: unit.sufix,
                  weight: UnitConverter.dispalyedWeight(
                    unit: unit,
                    value: e.value,
                  ),
                  onTap: () async {
                    final bloc = context.read<BodyWeightBloc>();

                    await showDialog<String>(
                      context: context,
                      builder: (context) => WeightDialog(
                        title: 'Edit weight',
                        value: UnitConverter.dispalyedWeight(
                          unit: unit,
                          value: e.value,
                        ),
                        suffix: unit.sufix,
                        dateTime: e.key,
                        onConfirm: (weight, date) {
                          final value = UnitConverter.dataWeight(
                            unit: unit,
                            value: weight,
                          );
                          bloc.add(
                            BodyWeightAdd(
                              weight: value,
                              date: date.toDay(),
                            ),
                          );
                        },
                        onDelete: () {
                          bloc.add(BodyWeightDelete(date: e.key));
                        },
                      ),
                    );
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }
}
