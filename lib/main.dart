import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';
import 'src/bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const FutureOfWorkoutApp());
}
