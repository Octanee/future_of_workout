import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_of_workout/models/fatigue.dart';
import '../models/muscle.dart';
import '../models/body.dart';

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
    required Map<Muscle, Fatigue> body,
    required String contourPath,
    bool isFront = true,
  }) {
    final children = <Widget>[
      SvgPicture.asset(contourPath),
    ];

    body.forEach((key, value) {
      children.add(getSVG(muscle: key, fatigue: value, isFront: isFront));
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
