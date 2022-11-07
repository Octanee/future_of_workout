import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';

class FinishButton extends StatelessWidget {
  const FinishButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: BarButton(
        text: context.locale.finishWorkout,
        icon: const AppIcon(iconData: AppIcons.stop),
        onTap: () async {
          final bloc = context.read<CurrentWorkoutBloc>();

          await showDialog<bool>(
            context: context,
            builder: (builderContext) => ConfirmDialog(
              title: context.locale.finishWorkout,
              content: Text(
                context.locale.finishWorkoutText,
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
