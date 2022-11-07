import 'package:future_of_workout/src/common.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    required this.onConfirm,
    this.text,
    this.dialogText,
    super.key,
  });

  final VoidCallback onConfirm;
  final String? text;
  final String? dialogText;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: text ?? context.locale.delete,
      icon: const AppIcon(iconData: AppIcons.trash),
      onTap: () async {
        await showDialog<void>(
          context: context,
          builder: (builderContext) => ConfirmDialog(
            title: text ?? context.locale.delete,
            content: Text(
              dialogText ?? context.locale.deleteText(''),
              style: AppTextStyle.medium16,
            ),
            onConfirm: onConfirm,
          ),
        );
      },
    );
  }
}
