import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/models.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({required this.body, this.isFront = true, Key? key})
      : super(key: key);

  final bool isFront;
  final Body body;

  @override
  Widget build(BuildContext context) {
    return isFront ? getFront() : getBack();
  }

  Widget getFront() {
    return generateBody(
      body: body.getFront(),
      contourPath: 'assets/body/front/contour.svg',
    );
  }

  Widget getBack() {
    return generateBody(
      body: body.getBack(),
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

    body.forEach((element) {
      children.add(getSVG(
        muscle: element.muscle,
        fatigue: element.fatigue,
        isFront: isFront,
      ));
    });

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
