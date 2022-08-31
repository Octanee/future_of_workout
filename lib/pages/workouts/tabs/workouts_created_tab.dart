import 'package:flutter/material.dart';

import '../../../widgets/tab_wrapper.dart';
import '../widgets/workout_item.dart';

class WorkoutsCreatedTab extends StatelessWidget {
  const WorkoutsCreatedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabWrapper(
      hasFloatingActionButton: true,
      onPressedFloatingActionButton: () {},
      floatingActionButtonIcon: Icons.add,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      physics: const BouncingScrollPhysics(),
      itemCount: 9,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.5,
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => const WorkoutItem(),
    );
  }
}
