import 'package:flutter/material.dart';
import 'package:future_of_workout/pages/body/body_page.dart';
import 'package:future_of_workout/pages/discover/discover_page.dart';
import 'package:future_of_workout/pages/settings/settings_page.dart';
import 'package:future_of_workout/pages/workouts/workouts_page.dart';

import '../various/colors.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final _pages = const [
    WorkoutsPage(),
    BodyPage(),
    DiscoverPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          elevation: 2,
          indicatorColor: AppColors.yellow,
          backgroundColor: AppColors.white,
        ),
        child: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) => {
            setState(() => selectedIndex = index),
          },
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: AppColors.grey,
                ),
                label: 'Workouts'),
            NavigationDestination(
                icon: Icon(
                  Icons.sports_gymnastics,
                  color: AppColors.grey,
                ),
                label: 'Body'),
            NavigationDestination(
                icon: Icon(
                  Icons.search,
                  color: AppColors.grey,
                ),
                label: 'Discover'),
            NavigationDestination(
                icon: Icon(
                  Icons.settings,
                  color: AppColors.grey,
                ),
                label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
