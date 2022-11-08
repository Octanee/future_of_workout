// ignore_for_file: lines_longer_than_80_chars

part of 'instructions.dart';

/// The translations for English (`en`).
class InstructionsEn extends Instructions {
  @override
  List<String> get _benchPress => [
        'Lie on a flat bench',
        'Grip the barbell with both hands',
        'Unrack the barbell and hold the bar directly above your shoulders',
        'Lower the barbell to your chest',
        'Press the barbell back to the starting point',
      ];

  @override
  List<String> get _deadlift => [
        'Begin with the barbell on the floor',
        'Grip the barbell with a hook or overhand grip',
        'Look straight ahead and take the slack out of the bar',
        'Lift the bar off the floor in a controlled manner',
        'Stand up and lockout',
        'Lower the bar down in a controlled manner',
      ];

  @override
  List<String> get _squat => [
        'Grip the barbell and stand up to lift it off the rack',
        'Step back with each leg until you are clear of the rack, setting up your footing for the lift',
        'Lower yourself until your thighs are at most parallel to the floor',
        'Raise yourself back up to standing',
        'Step forward to rerack the barbell',
      ];
}
