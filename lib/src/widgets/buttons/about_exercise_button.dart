import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:go_router/go_router.dart';

class AboutExerciseButton extends StatelessWidget {
  const AboutExerciseButton({required this.exerciseId, super.key});

  final String exerciseId;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: context.locale.aboutExercise,
      icon: const AppIcon(iconData: AppIcons.info),
      onTap: () {
        context.pushNamed(
          ExerciseDetailsPage.name,
          params: {'exerciseId': exerciseId},
        );
      },
    );
  }
}
