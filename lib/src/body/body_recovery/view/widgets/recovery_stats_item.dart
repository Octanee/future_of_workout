import 'package:body_api/body_api.dart';
import 'package:future_of_workout/src/common.dart';

class RecoveryStatsItem extends StatelessWidget {
  const RecoveryStatsItem({
    required this.muscle,
    required this.involvement,
    super.key,
  });

  final Muscle muscle;
  final int involvement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          textBaseline: TextBaseline.alphabetic,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                context.locale.muscle(muscle.name),
                style: AppTextStyle.semiBold20,
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: BoldText(
                boldText: '$involvement',
                mediumText: '%',
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
