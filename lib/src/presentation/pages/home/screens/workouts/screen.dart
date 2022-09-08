import 'package:flutter/material.dart';
import 'package:future_of_workout/src/presentation/pages/home/screens/workouts/tabs/tabs.dart';
import 'package:future_of_workout/src/presentation/widgets/widgets.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'My Workouts',
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: const [
          CustomTabBar(
            tabs: [
              Tab(text: 'Created'),
              Tab(text: 'Records'),
              Tab(text: 'Saved'),
            ],
          ),
          CustomTabBarView(
            children: [
              WorkoutsCreatedListTab(),
              WorkoutsRecordsTab(),
              WorkoutsSavedTab(),
            ],
          )
        ],
      ),
    );
  }
}
