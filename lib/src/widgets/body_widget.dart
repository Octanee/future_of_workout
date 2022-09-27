import 'package:exercise_api/exercise_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_of_workout/src/styles/app_colors.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({this.isFront = true, super.key});

  final bool isFront;

  @override
  Widget build(BuildContext context) {
    final contourPath = isFront
        ? 'assets/body/front/contour.svg'
        : 'assets/body/back/contour.svg';

    final children = <Widget>[
      SvgPicture.asset(contourPath),
    ];

    for (final muscle in Muscle.values) {
      final path = isFront ? muscle.imagePathFront : muscle.imagePathBack;

      if (path != null) {
        children.add(
          SvgPicture.asset(
            path,
            fit: BoxFit.scaleDown,
            color: AppColors.background,
          ),
        );
      }
    }

    return Stack(
      children: children,
    );
  }
}
