import 'package:flutter/material.dart';

import '../styles/styles.dart';
import 'app_scaffold.dart';

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
