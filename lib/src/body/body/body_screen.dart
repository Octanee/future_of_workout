import 'package:flutter/material.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  static String name = HomeNavigationItem.body.name;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'My Body',
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const CustomTabBar(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              tabs: [
                Tab(text: 'Recovery'),
                Tab(text: 'Weight'),
                Tab(text: 'Measurement'),
              ],
            ),
            CustomTabBarView(
              children: [
                AppScaffold(body: Container()),
                AppScaffold(body: Container()),
                AppScaffold(body: Container()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
