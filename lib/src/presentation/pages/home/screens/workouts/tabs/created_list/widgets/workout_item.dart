import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../data/models/models.dart';
import '../../../../../../../styles/styles.dart';
import '../../../../../../../widgets/widgets.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({required this.workout, Key? key}) : super(key: key);

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => CustomCard(
        onTap: () => context.go('/workout/${workout.id}'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              getBody(constraints),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  width: constraints.maxWidth * 0.7,
                  child: Text(
                    workout.name,
                    style: AppTextStyle.semiBold16,
                    softWrap: true,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(BoxConstraints constraints) => Positioned(
        left: constraints.maxWidth * -0.25,
        height: constraints.maxHeight * 1.5,
        top: constraints.maxHeight * 0.1,
        width: constraints.maxWidth * 0.8,
        child: const BodyWidget(
          body: Body(),
        ),
      );
}
