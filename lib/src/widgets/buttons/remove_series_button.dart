import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class RemoveSeriesButton extends StatelessWidget {
  const RemoveSeriesButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: 'Remove series',
      icon: const Icon(Icons.remove),
      onTap: onTap,
    );
  }
}
