import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({this.text, super.key});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: AppColors.yellow,
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
      ),
    );
  }
}
