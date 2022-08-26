import 'package:flutter/material.dart';
import 'package:future_of_workout/pages/workouts/tabs/workouts_created_tab.dart';
import 'package:future_of_workout/pages/workouts/tabs/workouts_records_tab.dart';
import 'package:future_of_workout/pages/workouts/tabs/workouts_saved_tab.dart';

import '../../custom/colors.dart';
import '../../custom/text_style.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
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
    return SingleChildScrollView(
      child: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTabBar(),
            _buildTabBarView(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBarView() {
    return Flexible(
      child: Container(
        decoration: const BoxDecoration(color: Colors.amber),
        height: 500,
        child: const TabBarView(
          children: [
            WorkoutsCreatedTab(),
            WorkoutsRecordsTab(),
            WorkoutsSavedTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        height: 48,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: AppColors.white),
        child: TabBar(
          labelColor: AppColors.grey,
          labelStyle: AppTextStyle.textStyleSemiBold16,
          indicator: BoxDecoration(
            color: AppColors.yellow,
            borderRadius: BorderRadius.circular(16),
          ),
          tabs: const [
            Tab(text: 'Created'),
            Tab(text: 'Records'),
            Tab(text: 'Saved'),
          ],
        ),
      ),
    );
  }
}

/*
SingleChildScrollView(
        child: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                
                
              ],
            ),
          ),
        ),
      ),
      */
