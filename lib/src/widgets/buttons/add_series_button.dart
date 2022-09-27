import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class AddSeriesButton extends StatelessWidget {
  const AddSeriesButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: 'Add series',
      icon: const Icon(Icons.add),
      onTap: onTap,
    );
  }
}
