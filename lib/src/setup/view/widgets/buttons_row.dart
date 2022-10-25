import 'package:flutter/material.dart';
import 'package:future_of_workout/src/setup/view/widgets/widgets.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    required this.pageIndex,
    required this.length,
    required this.nextPage,
    required this.previousPage,
    required this.onFinish,
    super.key,
  });

  final int pageIndex;
  final int length;
  final VoidCallback nextPage;
  final VoidCallback previousPage;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    final isLastPage = pageIndex == length - 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReturnButton(
          isVisible: pageIndex != 0,
          onPressed: previousPage,
        ),
        ContinueButton(
          onPressed: isLastPage ? onFinish : nextPage,
          text: isLastPage ? 'Finish Setup' : 'Continue',
        ),
      ],
    );
  }
}
