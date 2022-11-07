import 'package:future_of_workout/src/common.dart';

class AddButton extends StatelessWidget {
  const AddButton({required this.onTap, this.text, super.key});

  final VoidCallback onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: text ?? context.locale.add,
      icon: const AppIcon(iconData: AppIcons.plus),
      onTap: onTap,
    );
  }
}
