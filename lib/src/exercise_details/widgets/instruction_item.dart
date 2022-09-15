import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/app_text_style.dart';
import 'package:future_of_workout/src/widgets/custom_card.dart';

class InstructionItem extends StatelessWidget {
  const InstructionItem({
    required this.text,
    this.padding = const EdgeInsets.only(bottom: 8),
    super.key,
  });

  final String text;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: CustomCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: AppTextStyle.medium16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
