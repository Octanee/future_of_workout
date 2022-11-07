import 'package:future_of_workout/src/common.dart';

class NewWorkoutDialog extends StatelessWidget {
  const NewWorkoutDialog({required this.onConfirm, super.key});

  final ValueChanged<String> onConfirm;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return CustomDialog(
      title: context.locale.newWorkout,
      content: TextField(
        controller: controller,
        style: AppTextStyle.bold28,
        decoration: InputDecoration(
          hintText: context.locale.name,
        ),
      ),
      confirmButtonText: context.locale.add,
      onConfirm: () {
        final name = controller.text;

        onConfirm(name);
      },
    );
  }
}
