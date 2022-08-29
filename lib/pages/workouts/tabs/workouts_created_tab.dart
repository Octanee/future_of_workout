import 'package:flutter/material.dart';
import 'package:future_of_workout/widgets/custom_card.dart';
import 'package:future_of_workout/widgets/tab_wrapper.dart';

class WorkoutsCreatedTab extends StatelessWidget {
  const WorkoutsCreatedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabWrapper(
      onPressedFloatingActionButton: () {},
      floatingActionButtonIcon: Icons.calendar_month,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => const CustomCard(
        child: SizedBox(
          height: 250,
        ),
      ),
    );
  }
}
