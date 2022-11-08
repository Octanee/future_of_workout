import 'package:exercise_api/exercise_api.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/exercise/exercise_details/view/widgets/widgets.dart';

class MusclesList extends StatelessWidget {
  const MusclesList({
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    super.key,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseDetailsBloc, ExerciseDetailsState>(
      builder: (context, state) {
        final muscles = state.exercise!.muscles;
        final primary = muscles.keys
            .where((element) => muscles[element] == MuscleInvolvement.primary)
            .toList();
        final secondary = muscles.keys
            .where((element) => muscles[element] != MuscleInvolvement.primary)
            .toList();

        return Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._buildSection(
                title: context.locale.primaryMuscle,
                muscles: primary,
              ),
              if (secondary.isNotEmpty)
                ..._buildSection(
                  title: context.locale.secondaryMuscle,
                  muscles: secondary,
                ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildSection({
    required String title,
    required List<Muscle> muscles,
  }) {
    return [
      Header(text: title),
      for (var muscle in muscles) MuscleItem(muscle: muscle),
    ];
  }
}
