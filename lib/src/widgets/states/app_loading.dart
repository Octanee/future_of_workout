import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:lottie/lottie.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    this.lottieName = 'assets/lottie/loading.json',
    this.text,
    super.key,
  });

  final String? text;
  final String lottieName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            lottieName,
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
