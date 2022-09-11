import 'package:flutter/material.dart';
import 'package:future_of_workout/src/home/home.dart';

import 'package:future_of_workout/src/styles/app_text_style.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, this.error, this.name});

  final Exception? error;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: name ?? 'Page Not Found',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(
              padding: const EdgeInsets.all(16),
              child: Text(
                error.toString(),
                style: AppTextStyle.semiBold16,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            BarButton(
              text: 'Home',
              icon: const Icon(Icons.home),
              onTap: () => context.goNamed(HomePage.name),
            ),
          ],
        ),
      ),
    );
  }
}
