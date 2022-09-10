import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class WorkoutsRecordsTab extends StatelessWidget {
  const WorkoutsRecordsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasAppBar: false,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
