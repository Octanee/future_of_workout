import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

import 'package:go_router/go_router.dart';

class AppError extends StatelessWidget {
  const AppError({this.text = 'Something gone wrong...', super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppTextStyle.semiBold20,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: BarButton(
                text: 'Back',
                icon: Icons.arrow_back,
                onTap: () => context.pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
