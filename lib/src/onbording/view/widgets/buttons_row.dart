import 'package:flutter/material.dart';
import 'package:future_of_workout/src/onbording/view/widgets/widgets.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    required this.pageIndex,
    required this.length,
    required this.nextPage,
    required this.previousPage,
    super.key,
  });

  final int pageIndex;
  final int length;
  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReturnButton(
          isVisible: pageIndex != 0,
          onPressed: previousPage,
        ),
        ContinueButton(
          isVisible: pageIndex != length - 1,
          onPressed: nextPage,
        ),
      ],
    );
  }
}
