import 'package:flutter/material.dart';
import 'package:future_of_workout/widgets/custom_card.dart';
import 'package:future_of_workout/widgets/tab_wrapper.dart';

class WorkoutsRecordsTab extends StatelessWidget {
  const WorkoutsRecordsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabWrapper(
      hasFloatingActionButton: false,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => const CustomCard(
          child: SizedBox(
            height: 200,
          ),
        ),
      ),
    );
  }
}
