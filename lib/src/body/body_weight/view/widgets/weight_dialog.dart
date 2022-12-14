import 'package:flutter/services.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:intl/intl.dart';

class WeightDialog extends StatefulWidget {
  const WeightDialog({
    super.key,
    required this.onConfirm,
    this.title,
    this.confirmButtonText,
    this.onDelete,
    this.value,
    this.dateTime,
    this.suffix = 'kg',
  });

  final double? value;
  final DateTime? dateTime;
  final String? title;
  final void Function(double weight, DateTime dateTime) onConfirm;
  final VoidCallback? onDelete;
  final String? confirmButtonText;
  final String suffix;

  @override
  State<WeightDialog> createState() => _WeightDialogState();
}

class _WeightDialogState extends State<WeightDialog> {
  late final TextEditingController controller;
  late DateTime dateTime;

  @override
  void initState() {
    controller = TextEditingController(text: widget.value?.toString());
    dateTime = widget.dateTime ?? DateTime.now();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('EEE, d MMM', context.languageCode);
    return CustomDialog(
      title: widget.title ?? context.locale.addSeries,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d*\.?\d{0,1}'),
                ),
                NumericalRangeFormatter(min: 0, max: 999)
              ],
              textAlign: TextAlign.center,
              style: AppTextStyle.bold28,
              decoration: InputDecoration(
                hintText: context.locale.weight,
                suffixText: widget.suffix,
                counterText: '',
              ),
            ),
          ),
          Visibility(
            visible: widget.dateTime == null,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: dateTime,
                  firstDate: DateTime.now().subtract(
                    const Duration(days: 365 * 10),
                  ),
                  lastDate: DateTime.now(),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: AppColors.yellow,
                          onPrimary: AppColors.grey,
                          onSurface: AppColors.grey,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.yellow,
                          ),
                        ),
                        dialogTheme: DialogTheme(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (date != null) {
                  setState(() {
                    dateTime = date;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppIcon(iconData: AppIcons.calendarEdit),
                    Text(
                      formatter.format(dateTime),
                      style: AppTextStyle.semiBold20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.onDelete != null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.locale.delete,
                  style: AppTextStyle.semiBold16,
                ),
                IconButton(
                  onPressed: () {
                    widget.onDelete!();
                    Navigator.of(context).pop();
                  },
                  icon: const AppIcon(iconData: AppIcons.trash),
                ),
              ],
            ),
          ),
        ],
      ),
      confirmButtonText: widget.confirmButtonText,
      onConfirm: () {
        final value = double.tryParse(controller.text);

        if (value != null) {
          widget.onConfirm(value, dateTime);
        }
      },
    );
  }
}
