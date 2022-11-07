import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class ExerciseImagesCard extends StatelessWidget {
  const ExerciseImagesCard({
    required this.imagePath,
    required this.imagePathSecondary,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    super.key,
  });

  final String imagePath;
  final String imagePathSecondary;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = constraints.maxWidth / 2;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  imagePath,
                  width: size,
                ),
                SvgPicture.asset(
                  imagePathSecondary,
                  width: size,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
