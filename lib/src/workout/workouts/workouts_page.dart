import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  static String name = HomeNavigationItem.workouts.name;

  static Map<String, String> params = {'homePageTab': name};

  @override
  Widget build(BuildContext context) {
    return HomeWrapper(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            CustomTabBar(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              tabs: [
                Tab(text: context.locale.created),
                // Tab(text: 'Goals'),
                Tab(text: context.locale.saved),
              ],
            ),
            const CustomTabBarView(
              children: [
                WorkoutsListTab(),
                WorkoutsLogsTab(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
