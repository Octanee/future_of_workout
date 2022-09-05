import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'tabs/tabs.dart';

class WorkoutExercisesListView extends StatelessWidget {
  const WorkoutExercisesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Exercises',
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const CustomTabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Muscle'),
                Tab(text: 'Category'),
              ],
            ),
            const CustomTabBarView(
              children: [
                WorkoutExercisesListAllTab(),
                WorkoutExercisesListMuscleTab(),
                WorkoutExercisesListCategoryTab(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
