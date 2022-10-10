import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class AppEmptyList extends StatelessWidget {
  const AppEmptyList({
    this.text = 'Empty list',
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            // TODO(Octane): Change empty list icon
            Icons.cloud_outlined,
            color: AppColors.yellow,
            size: 72,
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
