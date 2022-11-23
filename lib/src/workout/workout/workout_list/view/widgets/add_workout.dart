import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/plan_selection/plan_selection_page.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:future_of_workout/src/workout/workout/workout_list/view/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class AddWorkout extends StatelessWidget {
  const AddWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutListBloc, WorkoutListState>(
      buildWhen: (previous, current) =>
          previous.currentPlanId != current.currentPlanId,
      builder: (context, state) {
        return SpeedDial(
          overlayColor: AppColors.grey,
          overlayOpacity: 0.4,
          children: [
            _addWorkout(context, isVisible: state.currentPlanId != null),
            _selectPlan(context),
          ],
          spacing: 4,
          activeChild: const AppIcon(iconData: AppIcons.minus),
          child: const AppIcon(iconData: AppIcons.plus),
        );
      },
    );
  }

  SpeedDialChild _addWorkout(BuildContext context, {required bool isVisible}) {
    return SpeedDialChild(
      visible: isVisible,
      // TODO(intl): Translate
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

  SpeedDialChild _selectPlan(BuildContext context) {
    return SpeedDialChild(
      // TODO(intl): Translate
      label: 'Select plan',
      child: const AppIcon(iconData: AppIcons.listAdd),
      onTap: () {
        context.goNamed(
          PlanSelectionPage.name,
          params: PlanSelectionPage.params,
        );
      },
    );
  }
}
