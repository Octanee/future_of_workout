import 'package:exercise_api/exercise_api.dart';
import 'package:future_of_workout/src/common.dart';

class MuscleItem extends StatelessWidget {
  const MuscleItem({
    required this.muscle,
    super.key,
  });

  final Muscle muscle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  context.locale.muscle(muscle.name),
                  style: AppTextStyle.medium16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
