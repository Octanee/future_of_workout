import 'package:exercise_repository/exercise_repository.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/exercise/exercise_details/view/widgets/widgets.dart';

class ExerciseDetailsPage extends StatelessWidget {
  const ExerciseDetailsPage({required this.exerciseId, super.key});

  final String exerciseId;

  static String name = '/exercise-details';
  static String path = '$name/:exerciseId';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseDetailsBloc(
        exerciseRepository: context.read<ExerciseRepository>(),
      )..add(ExerciseDetailsLoadingRequested(id: exerciseId)),
      child: const ExerciseDetailsView(),
    );
  }
}

class ExerciseDetailsView extends StatelessWidget {
  const ExerciseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseDetailsBloc, ExerciseDetailsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case ExerciseDetailsStatus.initial:
          case ExerciseDetailsStatus.loading:
            return const AppScaffold(body: AppLoading());
          case ExerciseDetailsStatus.failure:
            return const AppScaffold(body: AppError());
          case ExerciseDetailsStatus.success:
            final exercise = state.exercise!;
            return AppScaffold(
              title: state.exercise!.name,
              body: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                physics: const BouncingScrollPhysics(),
                children: [
                  ExerciseImagesCard(
                    imagePath: exercise.imagePath,
                    imagePathSecondary: exercise.imagePathSecondary,
                  ),
                  const InststuctionsList(),
                  const MusclesList(),
                  // TODO(Feature): Equipment
                  //const EquipmentList(),
                  // TODO(Feature): Note
                ],
              ),
            );
        }
      },
    );
  }
}
