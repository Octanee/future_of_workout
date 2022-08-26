import 'package:flutter/material.dart';

class WorkoutsSavedTab extends StatelessWidget {
  const WorkoutsSavedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.blue),
      height: 500,
      child: const Center(
        child: Text('WorkoutsSavedTab'),
      ),
    );
  }
}
