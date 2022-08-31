import 'package:flutter/material.dart';

import 'pages/main_navigation.dart';

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
