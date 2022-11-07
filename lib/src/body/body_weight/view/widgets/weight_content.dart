import 'package:future_of_workout/src/body/body_weight/body_weight.dart';
import 'package:future_of_workout/src/common.dart';

class WeightContent extends StatelessWidget {
  const WeightContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyWeightBloc, BodyWeightState>(
      buildWhen: (previous, current) =>
          previous.period != current.period ||
          previous.measurements != current.measurements,
      builder: (context, state) {
        if (state.data.isEmpty) {
          return AppEmptyList(
            text: context.locale.weightEmptyList,
          );
        }

        return ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: const [
            DataPeriod(),
            WeightChart(),
            WeightsList(),
          ],
        );
      },
    );
  }
}
