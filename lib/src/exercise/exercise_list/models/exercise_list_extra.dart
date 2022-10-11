import 'package:flutter/material.dart';

class ExerciseListExtra {
  ExerciseListExtra({required this.onConfirm, this.multiSelected = true});

  final VoidCallback onConfirm;
  final bool multiSelected;
}
