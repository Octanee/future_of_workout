import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:go_router/go_router.dart';

class StartWorkout extends StatelessWidget {
  const StartWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: StartButton(
        text: context.locale.startWorkoutButtonText,
        onTap: () {
          context
              .read<CurrentWorkoutBloc>()
              .add(const CurrentWorkoutStartWorkout());
          context.goNamed(
            HomePage.name,
            params: {'homePageTab': CurrentWorkoutPage.name},
          );
        },
      ),
    );
  }
}
