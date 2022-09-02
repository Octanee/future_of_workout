import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/home/navigation/navigation.dart';
import '../../styles/styles.dart';
import 'screens/screens.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: _getNavigationBar(context),
    );
  }

  NavigationBarTheme _getNavigationBar(BuildContext context) {
    return NavigationBarTheme(
      data: const NavigationBarThemeData(
        elevation: 2,
        indicatorColor: AppColors.yellow,
        backgroundColor: AppColors.white,
      ),
      child: NavigationBar(
        selectedIndex:
            context.select<NavigationCubit, int>((value) => value.state.index),
        onDestinationSelected: (index) =>
            context.read<NavigationCubit>().changeDestination(index: index),
        destinations: _getDestinations,
      ),
    );
  }

  Widget _getBody() {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        switch (state.item) {
          case NavbarItem.workouts:
            return const WorkoutsScreen();
          case NavbarItem.body:
            return const BodyScreen();
          case NavbarItem.discover:
            return const DiscoverScreen();
          case NavbarItem.settings:
            return const SettingsScreen();
        }
      },
    );
  }

  List<Widget> get _getDestinations {
    return const [
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
    ];
  }
}
