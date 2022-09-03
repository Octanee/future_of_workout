import 'package:flutter/material.dart';

import 'screen.dart';

class WorkoutDetailsPage extends StatelessWidget {
  const WorkoutDetailsPage({required this.id, Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return WorkoutDetailsScreen();
  }
}
