import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';

class DataList extends StatelessWidget {
  const DataList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseStatsBloc, ExerciseStatsState>(
      buildWhen: (previous, current) => previous.data != current.data,
      builder: (context, state) {
        if (state.data.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: AppEmptyList(
              text: context.locale.exerciseStatsEmptyList,
            ),
          );
        }

        return Column(
          children: const [
            DataPeriod(),
            ChartTypeBar(),
            WeightChart(),
            LogsList(),
          ],
        );
      },
    );
  }
}
