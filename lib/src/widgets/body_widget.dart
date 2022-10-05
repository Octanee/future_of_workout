import 'package:body_api/body_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_of_workout/src/styles/app_colors.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    required this.body,
    this.height = 926,
    super.key,
  });

  final Body body;
  final double height;

  @override
  Widget build(BuildContext context) {
    final isFront = body.position == BodyPosition.front ||
        body.position == BodyPosition.frontUpper ||
        body.position == BodyPosition.frontLower;

    final contourPath = isFront
        ? 'assets/body/front/contour.svg'
        : 'assets/body/back/contour.svg';

    final children = <Widget>[_getSvg(path: contourPath)];

    for (final muscle in Muscle.values) {
      final path = isFront ? muscle.imagePathFront : muscle.imagePathBack;

      if (path != null) {
        final color = _getColor(involvement: body.involvement(muscle: muscle));

        children.add(_getSvg(path: path, color: color));
      }
    }

    return Stack(
      alignment: Alignment.center,
      children: children,
    );
  }

  Widget _getSvg({required String path, Color color = AppColors.grey}) {
    return SvgPicture.asset(
      path,
      allowDrawingOutsideViewBox: true,
      height: height,
      fit: BoxFit.cover,
      color: color,
    );
  }

  Color _getColor({required int involvement}) {
    if (involvement > 120) {
      return AppColors.body120;
    } else if (involvement > 110) {
      return AppColors.body110;
    } else if (involvement > 100) {
      return AppColors.body100;
    } else if (involvement > 90) {
      return AppColors.body90;
    } else if (involvement > 80) {
      return AppColors.body80;
    } else if (involvement > 70) {
      return AppColors.body70;
    } else if (involvement > 60) {
      return AppColors.body60;
    } else if (involvement > 50) {
      return AppColors.body50;
    } else if (involvement > 40) {
      return AppColors.body40;
    } else if (involvement > 30) {
      return AppColors.body30;
    } else if (involvement > 20) {
      return AppColors.body20;
    } else if (involvement > 10) {
      return AppColors.body10;
    } else {
      return AppColors.body0;
    }
  }
}
