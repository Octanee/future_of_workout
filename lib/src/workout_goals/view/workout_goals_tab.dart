import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout_goals/workout_goals.dart';
import 'package:goal_repository/goal_repository.dart';

class WorkoutGoalsTab extends StatelessWidget {
  const WorkoutGoalsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutGoalsBloc(
        goalRepository: context.read<GoalRepository>(),
      )..add(const WorkoutGoalsSubscriptionRequested()),
      child: const WorkoutGoalsView(),
    );
  }
}

class WorkoutGoalsView extends StatelessWidget {
  const WorkoutGoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeWrapper(
      floatingActionButton: const SearchFab(),
      body: BlocBuilder<WorkoutGoalsBloc, WorkoutGoalsState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          switch (state.status) {
            case WorkoutGoalsStatus.initial:
            case WorkoutGoalsStatus.loading:
              return const AppLoading();
            case WorkoutGoalsStatus.failure:
              return const AppScaffold(body: AppError());
            case WorkoutGoalsStatus.empty:
              return AppEmptyList(text: context.locale.goalsEmptyList);
            case WorkoutGoalsStatus.loaded:
            case WorkoutGoalsStatus.add:
              return const GoalsList();
          }
        },
      ),
    );
  }
}
