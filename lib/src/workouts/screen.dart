import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/data/repositories/repositories.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workouts/cubit/created_list_cubit.dart';
import 'package:future_of_workout/src/workouts/workouts.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CreatedListCubit(repository: context.read<FakeWorkoutRepository>()),
      child: AppScaffold(
        title: 'My Workouts',
        body: _buildContent(),
      ),
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
              WorkoutsCreatedListTab(),
              WorkoutsRecordsTab(),
              WorkoutsSavedTab(),
            ],
          )
        ],
      ),
    );
  }
}
