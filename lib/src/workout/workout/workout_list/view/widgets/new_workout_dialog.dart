import 'package:future_of_workout/src/common.dart';

class NewWorkoutDialog extends StatelessWidget {
  const NewWorkoutDialog({required this.onConfirm, super.key});

  final ValueChanged<String> onConfirm;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return CustomDialog(
      title: context.local.newWorkout,
      content: TextField(
        controller: controller,
        style: AppTextStyle.bold28,
        decoration: InputDecoration(
          hintText: context.local.name,
        ),
      ),
      confirmButtonText: context.local.add,
      onConfirm: () {
        final name = controller.text;

        onConfirm(name);
      },
    );
  }
}
