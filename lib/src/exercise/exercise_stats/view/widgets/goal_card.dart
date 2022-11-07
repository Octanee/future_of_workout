import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseStatsBloc, ExerciseStatsState>(
      buildWhen: (previous, current) => previous.goal != current.goal,
      builder: (context, state) {
        final goal = state.goal;

        if (goal == null) {
          return Container();
        }

        final unit = context.read<AppBloc>().state.user!.weightUnit;

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CustomCard(
            onTap: () async {
              final bloc = context.read<ExerciseStatsBloc>();

              await showDialog<void>(
                context: context,
                builder: (_) {
                  return GoalDialog(
                    title: context.locale.updateGoal,
                    confirmButtonText: context.locale.save,
                    value: UnitConverter.dispalyedWeight(
                      unit: unit,
                      value: goal.goal,
                    ).toString(),
                    suffix: unit.sufix,
                    onConfirm: (value) {
                      if (value != 0) {
                        bloc.add(
                          ExerciseStatsGoalChange(
                            value: UnitConverter.dataWeight(
                              unit: unit,
                              value: value,
                            ),
                          ),
                        );
                      } else {
                        bloc.add(const ExerciseStatsGoalDelete());
                      }
                    },
                    onDelete: () => bloc.add(const ExerciseStatsGoalDelete()),
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${context.locale.goal}:',
                    style: AppTextStyle.semiBold20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(
                        UnitConverter.dispalyedWeight(
                          unit: unit,
                          value: goal.goal,
                        ).toString(),
                        style: AppTextStyle.bold28,
                      ),
                      Text(unit.sufix, style: AppTextStyle.medium20),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.edit),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
