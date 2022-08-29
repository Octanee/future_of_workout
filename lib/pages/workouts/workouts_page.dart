import 'package:flutter/material.dart';
import 'package:future_of_workout/pages/workouts/tabs/workouts_created_tab.dart';
import 'package:future_of_workout/pages/workouts/tabs/workouts_records_tab.dart';
import 'package:future_of_workout/pages/workouts/tabs/workouts_saved_tab.dart';
import 'package:future_of_workout/widgets/custom_tab_bar.dart';
import 'package:future_of_workout/widgets/custom_tab_bar_view.dart';

import '../../custom/colors.dart';
import '../../custom/text_style.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.white,
        title: Text(
          'My Workouts',
          style: AppTextStyle.textStyleBold28,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.background,
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
              WorkoutsCreatedTab(),
              WorkoutsRecordsTab(),
              WorkoutsSavedTab(),
            ],
          )
        ],
      ),
    );
  }
}

