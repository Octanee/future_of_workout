import 'package:flutter/material.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
// import 'package:future_of_workout/src/workout/workout_goals/workout_goals.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  static String name = HomeNavigationItem.workouts.name;

  static Map<String, String> params = {'homePageTab': name};

  @override
  Widget build(BuildContext context) {
    return const WorkoutsView();
  }
}

class WorkoutsView extends StatelessWidget {
  const WorkoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: const [
              CustomTabBar(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                tabs: [
                  Tab(text: 'Created'),
                  // Tab(text: 'Goals'),
                  Tab(text: 'Saved'),
                ],
              ),
              CustomTabBarView(
                children: [
                  WorkoutsListTab(),
                  // WorkoutGoalsTab(),
                  WorkoutsLogsTab(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
