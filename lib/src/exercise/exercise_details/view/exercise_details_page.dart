import 'package:exercise_repository/exercise_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/exercise/exercise_details/view/widgets/widgets.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

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
      builder: (context, state) {
        if (state.status == ExerciseDetailsStatus.loading) {
          return _buildLoading();
        } else if (state.status == ExerciseDetailsStatus.success) {
          return _buildContent(state, context);
        }
        return _buildFailure();
      },
    );
  }

  Widget _buildContent(ExerciseDetailsState state, BuildContext context) {
    final exercise = state.exercise!;

    return AppScaffold(
      title: state.exercise!.name,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        physics: const BouncingScrollPhysics(),
        children: [
          ExerciseImagesCard(
            imagePath: exercise.imagePath,
            imagePathSecondary: exercise.imagePathSecondary,
          ),
          const InststuctionsList(),
          const MusclesList(),
          //const EquipmentList(),
        ],
      ),
    );
  }

  Widget _buildFailure() {
    return AppScaffold(
      body: Center(
        child: Text(
          'Something gone wrong...',
          style: AppTextStyle.semiBold20,
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const AppScaffold(
      body: AppLoading(),
    );
  }
}
