import 'package:flutter/material.dart';
import 'package:future_of_workout/src/presentation/pages/home/home.dart';
import 'package:future_of_workout/src/presentation/styles/app_text_style.dart';
import 'package:future_of_workout/src/presentation/widgets/app_scaffold.dart';
import 'package:future_of_workout/src/presentation/widgets/bar_button.dart';
import 'package:future_of_workout/src/presentation/widgets/custom_card.dart';
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
              icon: Icons.home,
              onTap: () => context.goNamed(HomePage.name),
            ),
          ],
        ),
      ),
    );
  }
}
