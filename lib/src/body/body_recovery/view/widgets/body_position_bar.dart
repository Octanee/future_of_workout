import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_recovery/body_recovery.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class BodyPositionBar extends StatelessWidget {
  const BodyPositionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyRecoveryBloc, BodyRecoveryState>(
      buildWhen: (previous, current) => previous.isFront != current.isFront,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ToggleBar(
            initialIndex: state.isFront ? 0 : 1,
            onChange: (index) {
              context
                  .read<BodyRecoveryBloc>()
                  .add(BodyRecoveryChangePosition(isFront: index == 0));
            },
            tabs: const [
              Tab(text: 'Front'),
              Tab(text: 'Back'),
            ],
          ),
        );
      },
    );
  }
}
