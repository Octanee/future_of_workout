import 'package:equatable/equatable.dart';

class ExerciseSeries extends Equatable {
  const ExerciseSeries({
    required this.index,
    this.weight = 0,
    this.reps = 12,
    this.rest = 120,
  });

  final int index;
  final double weight;
  final int reps;
  final int rest;

  ExerciseSeries copyWith({
    int? index,
    double? weight,
    int? reps,
    int? rest,
  }) {
    return ExerciseSeries(
      index: index ?? this.index,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      rest: rest ?? this.rest,
    );
  }

  @override
  List<Object?> get props => [index, weight, reps, rest];
}
