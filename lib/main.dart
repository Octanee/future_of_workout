import 'package:flutter/material.dart';
import 'package:future_of_workout/custom/text_style.dart';
import 'package:future_of_workout/custom/colors.dart';
import 'package:future_of_workout/pages/main_navigation.dart';

void main() {
  runApp(const FutureOfWorkoutApp());
}

class FutureOfWorkoutApp extends StatelessWidget {
  const FutureOfWorkoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainNavigation(),
    );
  }
}
