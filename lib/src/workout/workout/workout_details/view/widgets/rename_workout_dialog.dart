import 'package:future_of_workout/src/common.dart';

class RenameWorkoutDialog extends StatelessWidget {
  const RenameWorkoutDialog({
    required this.onConfirm,
    required this.name,
    super.key,
  });

  final ValueChanged<String> onConfirm;
  final String name;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: name);
    return CustomDialog(
      title: context.local.changeName,
      content: TextField(
        controller: controller,
        style: AppTextStyle.bold28,
        decoration: InputDecoration(
          hintText: context.local.name,
        ),
      ),
      onConfirm: () {
        final name = controller.text;

        onConfirm(name);
      },
    );
  }
}
