import 'package:flutter/material.dart';
import 'package:future_of_workout/custom/text_style.dart';
import 'package:future_of_workout/custom/colors.dart';

void main() {
  runApp(const FutureOfWorkoutApp());
}

class FutureOfWorkoutApp extends StatelessWidget {
  const FutureOfWorkoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.grey,
          selectedItemColor: AppColors.yellow,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: '',
            ),
          ],
        ),
        appBar: AppBar(
          elevation: 2,
          backgroundColor: AppColors.white,
          title: Text(
            'My Workouts',
            style: AppTextStyle.textStyleBold28,
          ),
          centerTitle: true,
        ),
        backgroundColor: AppColors.background,
      ),
    );
  }
}
