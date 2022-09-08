import 'package:flutter/material.dart';

import 'package:future_of_workout/src/presentation/styles/styles.dart';
import 'package:future_of_workout/src/presentation/widgets/widgets.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({this.onChanged, this.hintText, super.key});

  final String? hintText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomBar(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: AppColors.grey,
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              cursorColor: AppColors.yellow,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTextStyle.medium16
                    .copyWith(color: AppColors.grey.withAlpha(100)),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
