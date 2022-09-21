import 'package:equatable/equatable.dart';

class CurrentWorkoutSeries extends Equatable {
  const CurrentWorkoutSeries({
    required this.index,
    required this.weight,
    required this.reps,
    required this.rest,
    this.isFinished = false,
  });

  final int index;
  final bool isFinished;
  final double weight;
  final int reps;
  final int rest;

  @override
  List<Object?> get props => [index, isFinished, weight, reps, rest];

  CurrentWorkoutSeries copyWith({
    int? index,
    bool? isFinished,
    double? weight,
    int? reps,
    int? rest,
  }) {
    return CurrentWorkoutSeries(
      index: index ?? this.index,
      isFinished: isFinished ?? this.isFinished,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      rest: rest ?? this.rest,
    );
  }
}
