import 'package:body_api/body_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_recovery/body_recovery.dart';
import 'package:future_of_workout/src/body/body_recovery/view/widgets/widgets.dart';

class RecoveryStats extends StatelessWidget {
  const RecoveryStats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyRecoveryBloc, BodyRecoveryState>(
      buildWhen: (previous, current) => previous.body != current.body,
      builder: (context, state) {
        return Column(
          children: _getItems(body: state.body!),
        );
      },
    );
  }

  List<Widget> _getItems({required Body body}) {
    final list = <RecoveryStatsItem>[];

    for (final muscle in Muscle.values) {
      final involvement = body.involvement(muscle: muscle);
      if (involvement > 0) {
        list.add(RecoveryStatsItem(muscle: muscle, involvement: involvement));
      }
    }

    list.sort((a, b) => b.involvement.compareTo(a.involvement));

    return list;
  }
}
