import 'package:future_of_workout/src/common.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.negativeButtonText,
    this.confirmButtonText,
  });

  final String title;
  final Widget content;

  final VoidCallback onConfirm;
  final String? negativeButtonText;
  final String? confirmButtonText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: AppTextStyle.semiBold20,
      ),
      content: content,
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(negativeButtonText ?? context.locale.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop();
          },
          child: Text(confirmButtonText?? context.locale.save),
        ),
      ],
    );
  }
}
