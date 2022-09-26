import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class FinishButton extends StatelessWidget {
  const FinishButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: BarButton(
        text: 'Finish workout',
        icon: const Icon(Icons.stop_circle_outlined),
        onTap: () async {
          final bloc = context.read<CurrentWorkoutBloc>();

          await showDialog<bool>(
            context: context,
            builder: (builderContext) => ConfirmDialog(
              title: 'Finish workout?',
              content: Text(
                'Do you want to end your workout?',
                style: AppTextStyle.medium16,
              ),
              onConfirm: () => bloc.add(const CurrentWorkoutFinish()),
            ),
          );
        },
      ),
    );
  }
}
