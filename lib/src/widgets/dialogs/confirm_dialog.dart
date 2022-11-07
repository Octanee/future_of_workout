import 'package:future_of_workout/src/common.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.confirmButtonText,
  });

  final String title;
  final Widget content;
  final String? confirmButtonText;

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: title,
      content: content,
      onConfirm: onConfirm,
      confirmButtonText: confirmButtonText ?? context.locale.yes,
    );
  }
}
