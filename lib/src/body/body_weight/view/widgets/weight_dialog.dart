import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/src/formatter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class WeightDialog extends StatefulWidget {
  const WeightDialog({
    super.key,
    required this.onConfirm,
    this.title = 'Add weight',
    this.confirmButtonText = 'Add',
    this.onDelete,
    this.value,
    this.dateTime,
  });

  final String? value;
  final DateTime? dateTime;
  final String title;
  final void Function(double weight, DateTime dateTime) onConfirm;
  final VoidCallback? onDelete;
  final String confirmButtonText;

  @override
  State<WeightDialog> createState() => _WeightDialogState();
}

class _WeightDialogState extends State<WeightDialog> {
  late final TextEditingController controller;
  late DateTime dateTime;

  @override
  void initState() {
    controller = TextEditingController(text: widget.value);
    dateTime = widget.dateTime ?? DateTime.now();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: widget.title,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
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
            decoration: const InputDecoration(
              hintText: 'Weight',
              suffixText: 'kg',
              counterText: '',
            ),
          ),
          Visibility(
            visible: widget.dateTime == null,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              height: 100,
              child: CupertinoDatePicker(
                minimumYear: 2010,
                maximumYear: 2040,
                initialDateTime: dateTime,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (date) {
                  setState(() {
                    dateTime = date;
                  });
                },
              ),
            ),
          ),
          Visibility(
            visible: widget.onDelete != null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delete?',
                  style: AppTextStyle.semiBold16,
                ),
                IconButton(
                  onPressed: () {
                    widget.onDelete!();
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ],
      ),
      confirmButtonText: widget.confirmButtonText,
      onConfirm: () {
        final value = double.tryParse(controller.text) ?? 0;

        if (value > 25) {
          widget.onConfirm(value, dateTime);
        }
      },
    );
  }
}
