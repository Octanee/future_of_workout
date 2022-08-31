import 'package:flutter/material.dart';

import '../../various/colors.dart';
import '../../various/text_style.dart';
import '../../widgets/widgets.dart';
import 'tabs/tabs.dart';

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
