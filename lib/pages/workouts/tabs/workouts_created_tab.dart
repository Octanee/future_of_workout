import 'package:flutter/material.dart';

class WorkoutsCreatedTab extends StatelessWidget {
  const WorkoutsCreatedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.red),
      height: 500,
      child: const Center(
        child: Text('WorkoutsCreatedTab'),
      ),
    );
  }
}
