import 'package:body_api/body_api.dart';
import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/body_widget.dart';

class BodyContainer extends StatelessWidget {
  const BodyContainer({
    required this.body,
    required this.size,
    super.key,
  });

  final Body body;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          _getPositioned(position: body.position),
        ],
      ),
    );
  }

  Widget _getPositioned({
    required BodyPosition position,
  }) {
    switch (position) {
      case BodyPosition.front:
      case BodyPosition.back:
        return Positioned(
          top: 8,
          bottom: 8,
          child: BodyWidget(
            body: body,
            height: size - 16,
          ),
        );
      case BodyPosition.frontUpper:
      case BodyPosition.backUpper:
        return Positioned(
          top: 8,
          child: BodyWidget(
            body: body,
            height: size * 1.9,
          ),
        );
      case BodyPosition.frontLower:
      case BodyPosition.backLower:
        return Positioned(
          bottom: 8,
          child: BodyWidget(
            body: body,
            height: size * 1.5,
          ),
        );
    }
  }
}
