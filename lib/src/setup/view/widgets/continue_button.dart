import 'package:future_of_workout/src/common.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        label: Text(text),
        icon: const AppIcon(iconData: AppIcons.right),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 16,
            left: 16,
            right: 8,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
