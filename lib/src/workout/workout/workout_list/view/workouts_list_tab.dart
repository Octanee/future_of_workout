import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:future_of_workout/src/workout/workout/workout_list/view/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workouts/workouts.dart';
import 'package:go_router/go_router.dart';
import 'package:user_repository/user_repository.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutsListTab extends StatelessWidget {
  const WorkoutsListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return WorkoutListBloc(
          workoutRepository: context.read<WorkoutRepository>(),
          userRepository: context.read<UserRepository>(),
        )..add(const WorkoutListCurrentPlan());
      },
      child: const _WorkoutListView(),
    );
  }
}

class _WorkoutListView extends StatelessWidget {
  const _WorkoutListView();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      floatingActionButton: const AddWorkout(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        physics: const BouncingScrollPhysics(),
        children: [
          const StartWorkout(),
          BlocConsumer<WorkoutListBloc, WorkoutListState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == WorkoutListStatus.hasPlan) {
                context.read<WorkoutListBloc>().add(const WorkoutListLoading());
              }
              if (state.status == WorkoutListStatus.added) {
                context.goNamed(
                  WorkoutDetailsPage.name,
                  params: {
                    'homePageTab': WorkoutsPage.name,
                    'workoutId': state.newWorkoutId,
                  },
                );
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case WorkoutListStatus.initial:
                case WorkoutListStatus.loading:
                case WorkoutListStatus.hasPlan:
                  return const AppLoading();
                case WorkoutListStatus.failure:
                  return const AppError();
                case WorkoutListStatus.empty:
                  return AppEmptyList(
                    text: context.locale.workoutListEmpty,
                  );
                case WorkoutListStatus.noSelectedPlan:
                  return const AppEmptyList(
                    // TODO(intl): Translate
                    text: 'No plan selected',
                  );
                case WorkoutListStatus.loaded:
                case WorkoutListStatus.added:
                  return const WorkoutList();
              }
            },
          ),
        ],
      ),
    );
  }
}
