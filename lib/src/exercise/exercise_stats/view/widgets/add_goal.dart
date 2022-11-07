import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';

class AddGoal extends StatelessWidget {
  const AddGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseStatsBloc, ExerciseStatsState>(
      buildWhen: (previous, current) => previous.goal != current.goal,
      builder: (context, state) {
        return Visibility(
          visible: state.goal == null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: AddButton(
              text: context.locale.addGoal,
              onTap: () async {
                final unit = context.read<AppBloc>().state.user!.weightUnit;
                final bloc = context.read<ExerciseStatsBloc>();

                await showDialog<void>(
                  context: context,
                  builder: (_) {
                    return GoalDialog(
                      title: context.locale.addGoal,
                      suffix: unit.sufix,
                      onConfirm: (value) {
                        if (value != 0) {
                          bloc.add(
                            ExerciseStatsAddGoal(
                              value: UnitConverter.dataWeight(
                                unit: unit,
                                value: value,
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
