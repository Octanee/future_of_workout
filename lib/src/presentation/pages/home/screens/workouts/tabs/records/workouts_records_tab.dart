import 'package:flutter/material.dart';

import '../../../../../../widgets/widgets.dart';


class WorkoutsRecordsTab extends StatelessWidget {
  const WorkoutsRecordsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasAppBar: false,
      hasFloatingActionButton: false,
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
