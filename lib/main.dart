import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:future_of_workout/src/app.dart';
import 'package:future_of_workout/src/core/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const FutureOfWorkoutApp());
}
