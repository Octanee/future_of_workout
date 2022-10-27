import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:lottie/lottie.dart';

class AppEmptyList extends StatelessWidget {
  const AppEmptyList({
    this.text = 'Empty list',
    this.lottieName = 'assets/lottie/empty_list.json',
    super.key,
  });

  final String lottieName;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            lottieName,
            repeat: false,
          ),
          const SizedBox(height: 16),
          Text(
            text,
            style: AppTextStyle.semiBold20,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
