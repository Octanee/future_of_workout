import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'tabs/tabs.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({Key? key}) : super(key: key);

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
        children:  [
          const CustomTabBar(
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
