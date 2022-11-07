import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';

class ConfirmFab extends StatelessWidget {
  const ConfirmFab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseListBloc, ExerciseListState>(
      builder: (context, state) {
        final lenght = state.selected.values.where((element) => element).length;

        if (lenght < 1) {
          return Container();
        }

        switch (state.extra.selectionType) {
          case SelectionType.none:
            return Container();
          case SelectionType.single:
            return FloatingActionButton(
              child: state.extra.icon,
              onPressed: () {
                context
                    .read<ExerciseListBloc>()
                    .add(const ExerciseListConfirm());
              },
            );
          case SelectionType.multiple:
            return FloatingActionButton.extended(
              label: Text(
                // 'Add $lenght exercises',
                context.local.addExercisesCount(lenght),
                style: AppTextStyle.semiBold16,
              ),
              onPressed: () {
                context
                    .read<ExerciseListBloc>()
                    .add(const ExerciseListConfirm());
              },
            );
        }
      },
    );
  }
}
