import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_weight/body_weight.dart';
import 'package:future_of_workout/src/shared/extensions.dart';

class WeightsList extends StatelessWidget {
  const WeightsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyWeightBloc, BodyWeightState>(
      buildWhen: (previous, current) => previous.data != current.data,
      builder: (context, state) {
        final list = state.data;
        return Column(
          children: list
              .map<Widget>(
                (e) => WeightItem(
                  dateTime: e.key,
                  weight: e.value,
                  onTap: () async {
                    final bloc = context.read<BodyWeightBloc>();

                    await showDialog<String>(
                      context: context,
                      builder: (context) => WeightDialog(
                        title: 'Edit weight',
                        value: e.value.toString(),
                        dateTime: e.key,
                        onConfirm: (weight, date) {
                          bloc.add(
                            BodyWeightAdd(
                              weight: weight,
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
