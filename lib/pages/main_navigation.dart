import 'package:flutter/material.dart';


import '../various/colors.dart';
import 'body/body_page.dart';
import 'discover/discover_page.dart';
import 'settings/settings_page.dart';
import 'workouts/workouts_page.dart';

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
