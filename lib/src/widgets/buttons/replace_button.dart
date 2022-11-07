import 'package:future_of_workout/src/common.dart';

class ReplaceButton extends StatelessWidget {
  const ReplaceButton({required this.onTap, this.text, super.key});

  final VoidCallback onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: text ?? context.locale.replace,
      icon: const AppIcon(iconData: AppIcons.repeat),
      onTap: onTap,
    );
  }
}
