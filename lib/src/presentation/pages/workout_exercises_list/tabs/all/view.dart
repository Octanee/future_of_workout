import 'package:flutter/material.dart';

import '../../../../styles/app_colors.dart';
import '../../../../styles/app_text_style.dart';
import '../../../../widgets/widgets.dart';

class WorkoutExercisesListAllView extends StatelessWidget {
  const WorkoutExercisesListAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          _searchBar(),
        ],
      ),
    );
  }

  Widget _searchBar() {
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
              cursorColor: AppColors.yellow,
              decoration: InputDecoration(
                hintText: 'Search exercise',
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
