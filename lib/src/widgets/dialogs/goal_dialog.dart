import 'package:flutter/services.dart';
import 'package:future_of_workout/src/common.dart';

class GoalDialog extends StatelessWidget {
  const GoalDialog({
    required this.onConfirm,
    required this.title,
    this.confirmButtonText,
    this.onDelete,
    this.value,
    this.suffix = 'kg',
    super.key,
  });

  final String? value;
  final String suffix;
  final String title;
  final ValueChanged<double> onConfirm;
  final VoidCallback? onDelete;
  final String? confirmButtonText;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: value);
    return CustomDialog(
      title: title,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'^\d*\.?\d{0,2}'),
              ),
              NumericalRangeFormatter(min: 0, max: 999)
            ],
            textAlign: TextAlign.center,
            style: AppTextStyle.bold28,
            decoration: InputDecoration(
              hintText: context.locale.weight,
              suffixText: suffix,
              counterText: '',
            ),
          ),
          Visibility(
            visible: onDelete != null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.locale.delete,
                  style: AppTextStyle.semiBold16,
                ),
                IconButton(
                  onPressed: () {
                    onDelete!();
                    Navigator.of(context).pop();
                  },
                  icon: const AppIcon(iconData: AppIcons.trash,),
                ),
              ],
            ),
          ),
        ],
      ),
      confirmButtonText: confirmButtonText ?? context.locale.add,
      onConfirm: () {
        final value = double.tryParse(controller.text) ?? 0;

        onConfirm(value);
      },
    );
  }
}
