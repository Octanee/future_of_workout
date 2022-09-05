import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';
import 'src/core/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const FutureOfWorkoutApp());
}
