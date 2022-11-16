import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:future_of_workout/src/workout/workout/workout_list/view/widgets/widgets.dart';

class AddWorkout extends StatelessWidget {
  const AddWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      overlayColor: AppColors.grey,
      overlayOpacity: 0.4,
      children: [
        _addWorkout(context),
        _addPlan(context),
        _selectPlan(context),
      ],
     spacing: 4,
      activeChild: const AppIcon(iconData: AppIcons.minus),
      child: const AppIcon(iconData: AppIcons.plus),
    );
  }

  SpeedDialChild _addWorkout(BuildContext context) {
    return SpeedDialChild(
      label: 'Add workout',
      child: const AppIcon(iconData: AppIcons.plus),
      onTap: () async {
        final bloc = context.read<WorkoutListBloc>();

        await showDialog<String>(
          context: context,
          builder: (context) => NewWorkoutDialog(
            onConfirm: (name) =>
                bloc.add(WorkoutListNewWorkoutAdding(name: name)),
          ),
        );
      },
    );
  }

  SpeedDialChild _addPlan(BuildContext context) {
    return SpeedDialChild(
      label: 'Add plan',
      child: const AppIcon(iconData: AppIcons.listAdd),
    );
  }

  SpeedDialChild _selectPlan(BuildContext context) {
    return SpeedDialChild(
      label: 'Select plan',
      child: const AppIcon(iconData: AppIcons.list),
    );
  }
}
