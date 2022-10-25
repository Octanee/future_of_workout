import 'package:flutter/material.dart';
import 'package:future_of_workout/src/setup/view/widgets/widgets.dart';

class PositionIndicator extends StatelessWidget {
  const PositionIndicator({
    required this.length,
    required this.pageIndex,
    super.key,
  });

  final int length;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: 32,
        child: Row(
          children: List.generate(
            length,
            (index) => DotIndicator(
              isSelected: pageIndex == index,
              isCompleted: pageIndex >= index,
            ),
          ),
        ),
      ),
    );
  }
}
