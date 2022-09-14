import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class ExerciseSeriesItem extends StatelessWidget {
  const ExerciseSeriesItem({
    super.key,
    required this.index,
    required this.reps,
    required this.weight,
    this.onTap,
  });

  final int index;
  final int reps;
  final double weight;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      child: CustomCard(
        onTap: onTap,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(64),
                color: AppColors.yellow,
              ),
              child: Center(
                child: Text(
                  '$index',
                  style: AppTextStyle.bold28,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        weight.toString(),
                        style: AppTextStyle.bold28,
                      ),
                      Text(
                        'kg',
                        style: AppTextStyle.medium16,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '/',
                      style:
                          AppTextStyle.bold28.copyWith(color: AppColors.yellow),
                    ),
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        reps.toString(),
                        style: AppTextStyle.bold28,
                      ),
                      Text(
                        'reps',
                        style: AppTextStyle.medium16,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// SizedBox(
//                     width: 108,
//                     child: TextField(
//                       focusNode: weightFocusNode,
//                       controller: weightController,
//                       keyboardType: TextInputType.number,
//                       inputFormatters: [
//                         FilteringTextInputFormatter.allow(
//                           RegExp(r'^\d*\.?\d{0,2}'),
//                         ),
//                         NumericalRangeFormatter(min: 0, max: 999)
//                       ],
//                       textAlign: TextAlign.end,
//                       onEditingComplete: weightFocusNode.unfocus,
//                       style: AppTextStyle.bold28,
//                       decoration: const InputDecoration(
//                         suffixText: 'kg',
//                         counterText: '',
//                       ),
//                     ),
//                   ),

// SizedBox(
//                     width: 90,
//                     child: TextField(
//                       focusNode: repsFocusNode,
//                       controller: repsController,
//                       keyboardType: TextInputType.number,
//                       inputFormatters: [
//                         FilteringTextInputFormatter.digitsOnly,
//                         NumericalRangeFormatter(max: 999, min: 1)
//                       ],
//                       textAlign: TextAlign.end,
//                       onEditingComplete: repsFocusNode.unfocus,
//                       style: AppTextStyle.bold28,
//                       decoration: const InputDecoration(
//                         suffixText: 'Reps',
//                         counterText: '',
//                       ),
//                     ),
//                   ),