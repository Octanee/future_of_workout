import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:future_of_workout/src/data/models/models.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({required this.body, super.key});

  final Body body;

  @override
  Widget build(BuildContext context) {
    return getFront();
  }

  // bool isFront() {
  //   return [
  //     BodyPosition.front,
  //     BodyPosition.frontUp,
  //     BodyPosition.frontDown,
  //   ].any((element) => element == body.bodyPosition);
  // }

  Widget getFront() {
    return generateBody(
      body: body.muscleFatigues,
      contourPath: 'assets/body/front/contour.svg',
    );
  }

  Widget getBack() {
    return generateBody(
      body: body.muscleFatigues,
      contourPath: 'assets/body/back/contour.svg',
      isFront: false,
    );
  }

  Widget generateBody({
    required List<MuscleFatigue> body,
    required String contourPath,
    bool isFront = true,
  }) {
    final children = <Widget>[
      SvgPicture.asset(contourPath),
    ];

    for (final element in body) {
      children.add(
        getSVG(
          muscle: element.muscle,
          fatigue: element.fatigue,
          isFront: isFront,
        ),
      );
    }

    return Stack(
      children: children,
    );
  }

  Widget getSVG({
    required Muscle muscle,
    required Fatigue fatigue,
    bool isFront = true,
  }) {
    final path = isFront ? muscle.pathFront : muscle.pathBack;

    if (path == null) return Container();

    return SvgPicture.asset(
      path,
      fit: BoxFit.scaleDown,
      color: fatigue.color,
    );
  }
}
