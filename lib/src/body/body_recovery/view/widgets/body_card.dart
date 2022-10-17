import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_recovery/body_recovery.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class BodyCard extends StatelessWidget {
  const BodyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyRecoveryBloc, BodyRecoveryState>(
      buildWhen: (previous, current) =>
          previous.body != current.body || previous.isFront != current.isFront,
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: BodyWidget(
                  isFront: state.isFront,
                  body: state.body!,
                  height: constraints.maxWidth * 1.5,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
