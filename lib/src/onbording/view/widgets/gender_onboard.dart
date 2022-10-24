import 'package:flutter/material.dart';

import 'package:future_of_workout/src/onbording/view/widgets/widgets.dart';
import 'package:future_of_workout/src/styles/app_colors.dart';
import 'package:future_of_workout/src/styles/app_text_style.dart';
import 'package:future_of_workout/src/widgets/cards/cards.dart';

class GenderOnboard extends StatelessWidget {
  const GenderOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardContent(
      title: "What's your gender?",
      description: 'This will help us set your goals more efficency',
      child: GridView(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
        ),
        children: [
          _GenderCard(
            icon: Icons.male_rounded,
            text: 'I am a male',
            onTap: () {},
            isSelected: true,
          ),
          _GenderCard(
            icon: Icons.female_rounded,
            text: 'I am a female',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _GenderCard extends StatelessWidget {
  const _GenderCard({
    required this.icon,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  });

  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 96,
            color: isSelected ? AppColors.yellow : AppColors.grey,
          ),
          Text(text, style: AppTextStyle.bold20),
        ],
      ),
    );
  }
}
