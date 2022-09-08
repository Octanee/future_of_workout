import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/logic/home/home.dart';
import 'package:future_of_workout/src/presentation/pages/home/screens/workouts/tabs/created_list/widgets/widgets.dart';
import 'package:future_of_workout/src/presentation/widgets/widgets.dart';

class WorkoutsCreatedListView extends StatelessWidget {
  const WorkoutsCreatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasAppBar: false,
      hasFloatingActionButton: true,
      onPressedFloatingActionButton: () async {
        await context.read<CreatedListCubit>().createWorkout();
      },
      floatingActionButtonIcon: Icons.add,
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<CreatedListCubit, CreatedListState>(
      builder: (context, state) {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          physics: const BouncingScrollPhysics(),
          itemCount: state.workouts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.5,
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) => WorkoutItem(
            workout: state.workouts[index],
          ),
        );
      },
    );
  }
}
