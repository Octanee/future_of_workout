class ExerciseSeries {
  const ExerciseSeries({
    this.weight = 0,
    this.reps = 12,
    this.rest = 120,
  });

  final double weight;
  final int reps;
  final int rest;

  ExerciseSeries copyWith({
    double? weight,
    int? reps,
    int? rest,
  }) {
    return ExerciseSeries(
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      rest: rest ?? this.rest,
    );
  }
}
