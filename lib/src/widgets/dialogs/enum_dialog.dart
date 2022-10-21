import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/dialogs/custom_dialog.dart';

class EnumDialog<T extends Enum> extends StatefulWidget {
  const EnumDialog({
    super.key,
    required this.onConfirm,
    required this.values,
    this.selected,
    this.title = 'Select',
    this.confirmButtonText = 'Select',
    this.negativeButtonText = 'Cancel',
  });

  final Map<T, String> values;
  final T? selected;
  final ValueChanged<T> onConfirm;
  final String title;
  final String confirmButtonText;
  final String negativeButtonText;

  @override
  State<EnumDialog<T>> createState() => _EnumDialogState<T>();
}

class _EnumDialogState<T extends Enum> extends State<EnumDialog<T>> {
  late T selected;

  @override
  void initState() {
    selected = widget.selected ?? widget.values.keys.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: widget.title,
      onConfirm: () => widget.onConfirm(selected),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: widget.values.keys
              .map<Widget>(
                (item) => RadioListTile<T>(
                  title: Text(widget.values[item]!),
                  value: item,
                  groupValue: selected,
                  onChanged: (value) {
                    if (value != selected) {
                      setState(() {
                        selected = value!;
                      });
                    }
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
