import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class AppError extends StatelessWidget {
  const AppError({this.text = 'Something gone wrong..', super.key});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.bug_report_outlined,
            color: AppColors.yellow,
            size: 72,
          ),
          const SizedBox(height: 16),
          if (text != null)
            Text(
              text!,
              style: AppTextStyle.semiBold20,
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
