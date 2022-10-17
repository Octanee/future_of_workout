import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_recovery/body_recovery.dart';
import 'package:future_of_workout/src/widgets/app_scaffold.dart';

class BodyRecoveryTab extends StatelessWidget {
  const BodyRecoveryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BodyRecoveryBloc(),
      child: const BodyRecoveryView(),
    );
  }
}

class BodyRecoveryView extends StatelessWidget {
  const BodyRecoveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyRecoveryBloc, BodyRecoveryState>(
      builder: (context, state) {
        return AppScaffold(body: Container());
      },
    );
  }
}
