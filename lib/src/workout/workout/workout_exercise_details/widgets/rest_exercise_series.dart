import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class RestExerciseSeries extends StatelessWidget {
  const RestExerciseSeries({
    super.key,
    required this.rest,
    this.onTap,
  });

  final int rest;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.timer_outlined),
          ),
          Text(
            'REST',
            style: AppTextStyle.semiBold20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              ':',
              style: AppTextStyle.bold20.copyWith(color: AppColors.yellow),
            ),
          ),
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                rest.toString(),
                style: AppTextStyle.bold28,
              ),
              Text(
                's',
                style: AppTextStyle.medium16,
              ),
            ],
          )
        ],
      ),
    );
  }
}

// TextField(
//                 focusNode: focusNode,
//                 controller: controller,
//                 keyboardType: TextInputType.number,
//                 onEditingComplete: focusNode.unfocus,
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                   NumericalRangeFormatter(min: 0, max: 999)
//                 ],
//                 textAlign: TextAlign.center,
//                 style: AppTextStyle.bold28,
//                 decoration: const InputDecoration(
//                   suffixText: 's',
//                   counterText: '',
//                 ),
//               ),
