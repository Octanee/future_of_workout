import 'package:flutter/material.dart';

class WorkoutsRecordsTab extends StatelessWidget {
  const WorkoutsRecordsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.green),
      height: 500,
      child: const Center(
        child: Text('WorkoutsRecordsTab'),
      ),
    );
  }
}
