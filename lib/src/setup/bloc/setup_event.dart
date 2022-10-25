part of 'setup_bloc.dart';

abstract class SetupEvent extends Equatable {
  const SetupEvent();

  @override
  List<Object> get props => [];
}

class SetupGenderChange extends SetupEvent {
  const SetupGenderChange({required this.gender});

  final Gender gender;

  @override
  List<Object> get props => [gender];
}

class SetupAgeChange extends SetupEvent {
  const SetupAgeChange({required this.age});

  final int age;

  @override
  List<Object> get props => [age];
}

class SetupHeightChange extends SetupEvent {
  const SetupHeightChange({required this.height});

  final double height;

  @override
  List<Object> get props => [height];
}

class SetupLengthUnitChange extends SetupEvent {
  const SetupLengthUnitChange({required this.lengthUnit});

  final LengthUnit lengthUnit;

  @override
  List<Object> get props => [lengthUnit];
}

class SetupWeightChange extends SetupEvent {
  const SetupWeightChange({required this.weight});

  final double weight;

  @override
  List<Object> get props => [weight];
}

class SetupWeightUnitChange extends SetupEvent {
  const SetupWeightUnitChange({required this.weightUnit});

  final WeightUnit weightUnit;

  @override
  List<Object> get props => [weightUnit];
}

class SetupFinish extends SetupEvent {
  const SetupFinish();
}
