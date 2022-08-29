import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_of_workout/widgets/custom_card.dart';

class WorkoutsRecordsTab extends StatelessWidget {
  const WorkoutsRecordsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(
            'assets/body/front.svg',
          ),
        ),
      ),
    );
  }
}
