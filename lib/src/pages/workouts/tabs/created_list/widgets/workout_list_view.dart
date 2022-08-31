import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../../models/models.dart';
import '../../../../../widgets/widgets.dart';
import '../../../../workout_details/page.dart';
import 'widgets.dart';

class WorkoutsCreatedListView extends StatelessWidget {
  const WorkoutsCreatedListView({required this.workouts, Key? key})
      : super(key: key);

  final List<Workout> workouts;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasAppBar: false,
      hasFloatingActionButton: true,
      onPressedFloatingActionButton: () {
        final workout = Workout(id: const Uuid().v1(), name: 'Workout');
        Navigator.push(
          context,
          WorkoutDetailsPage.route(
            workout: workout,
          ),
        );
      },
      floatingActionButtonIcon: Icons.add,
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      physics: const BouncingScrollPhysics(),
      itemCount: workouts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.5,
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => WorkoutItem(
        workout: workouts[index],
      ),
    );
  }
}
