import 'package:flutter/material.dart';
import 'package:future_of_workout/models/body.dart';
import 'package:future_of_workout/widgets/body_widget.dart';
import 'package:future_of_workout/widgets/custom_card.dart';

class WorkoutsRecordsTab extends StatelessWidget {
  const WorkoutsRecordsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BodyWidget(
            body: Body(),
          ),
        ),
      ),
    );
  }
}
