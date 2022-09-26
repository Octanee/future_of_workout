import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout_list/workout_list.dart';
import 'package:future_of_workout/src/workouts_logs/workouts_logs_tab.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkoutsScreenView();
  }
}

class WorkoutsScreenView extends StatelessWidget {
  const WorkoutsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'My Workouts',
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: const [
          CustomTabBar(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            tabs: [
              Tab(text: 'Created'),
              //Tab(text: 'Records'),
              Tab(text: 'Saved'),
            ],
          ),
          CustomTabBarView(
            children: [
              WorkoutsListTab(),
              //WorkoutsRecordsTab(),
              WorkoutsLogsTab(),
            ],
          )
        ],
      ),
    );
  }
}
