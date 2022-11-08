import 'package:exercise_api/exercise_api.dart';

/// {@template default_exercise_provider}
/// Provider of default [Exercise]s.
/// {@endtemplate}
class DefaultExerciseProvider {
  /// Static list of default [Exercise]s.
  static final List<Exercise> defaultExercises = [
    _benchPress,
    _squat,
    _deadlift,
    _shoulderPress,
    _barbellCurl,
    _bentOverRow,
    _frontSquat,
    _inclineBenchPress,
    _powerClean,
    _hexBarDeadlift,
    _sumoDeadlift,
    _hipThrust,
    _romanianDeadlift,
    _cleanAndJerk,
    _snatch,
    _clean,
    _barbellShrug,
    _closeGripBenchPress,
    _declineBenchPress,
    _cleanAndPress,
    _tBarRow,
    _eZBarCurl,
    _lyingTricepsExtension,
    _seatedShoulderPress,
    _preacherCurl,
    _rackPull,
    _pendlayRow,
    _uprightRow,
    _boxSquat,
    _tricepExtension,
    _bulgarianSplitSquat,
    _floorPress,
    _smithMachineBenchPress,
    _goodMorning,
    _stiffLegDeadlift,
    _barbellLunge,
    _zercherSquat,
    _smithMachineSquat,
    _overheadSquat,
    _wristCurl,
    _thruster,
    _pushJerk,
    _powerSnatch,
    _splitSquat,
    _barbellCalfRaise,
    _reverseGripBenchPress,
    _reverseWristCurl,
    _landmineSquat,
    _reverseBarbellCurl,
    _pausedBenchPress,
    _barbellGluteBridge,
    _barbellReverseLunge,
    _strictCurl,
    _deficitDeadlift,
    _neckCurl,
    _safetyBarSquat,
    _barbellHackSquat,
    _benchPinPress,
    _barbellFrontRaise,
    _behindTheNeckPress,
    _pauseSquat,
    _logPress,
    _benchPull,
    _cleanHighPull,
    _singleLegRomanianDeadlift,
    _splitJerk,
    _sumoSquat,
    _cleanPull,
    _yatesRow,
    _snatchDeadlift,
    _hangPowerClean,
    _barbellPullover,
    _jeffersonDeadlift,
    _pauseDeadlift,
    _landminePress,
    _singleLegDeadlift,
    _wideGripBenchPress,
    _muscleSnatch,
    _zPress,
    _neckExtension,
    _shoulderPinPress,
    _vikingPress,
    _spiderCurl,
    _snatchPull,
    _jMPress,
    _pinSquat,
    _wallBall,
    _cheatCurl,
    _walkingLunge,
    _closeGripInclineBenchPress,
    _smithMachineShrug,
    _oneArmLandminePress,
    _hexBarShrug,
    _zercherDeadlift,
    _bentArmBarbellPullover,
    _barbellPowerShrug,
    _halfSquat,
    _hangSnatch,
    _meadowsRow,
    _jeffersonSquat,
    _spotoPress,
    _behindTheBackDeadlift,
    _behindTheBackBarbellShrug,
    ..._generate,
  ];

  static List<Exercise> get _generate => DefaultExercise.values
      .map<Exercise>((exercise) => exercise.exercise())
      .toList();

  static Exercise get _benchPress => DefaultExercise.benchPress.exercise(
        muscles: const {
          Muscle.chest: MuscleInvolvement.primary,
          Muscle.triceps: MuscleInvolvement.secondary,
          Muscle.shoulders: MuscleInvolvement.additional,
        },
        imagePath: 'assets/exercises/barbell_bench_press_start.svg',
        imagePathSecondary: 'assets/exercises/barbell_bench_press_end.svg',
      );

  static Exercise get _squat => DefaultExercise.squat.exercise(
        muscles: const {
          Muscle.quadriceps: MuscleInvolvement.primary,
          Muscle.glutes: MuscleInvolvement.secondary,
          Muscle.hamstering: MuscleInvolvement.additional,
        },
        imagePath: 'assets/exercises/squat_end.svg',
        imagePathSecondary: 'assets/exercises/squat_start.svg',
      );

  static Exercise get _deadlift => DefaultExercise.deadlift.exercise(
        muscles: const {
          Muscle.hamstering: MuscleInvolvement.primary,
          Muscle.glutes: MuscleInvolvement.secondary,
          Muscle.erectorSpinae: MuscleInvolvement.secondary,
        },
        imagePath: 'assets/exercises/deadlift_start.svg',
        imagePathSecondary: 'assets/exercises/deadlift_end.svg',
      );

  // TODO(Exercise): Create w chuj exercises :()

  static Exercise get _shoulderPress =>
      DefaultExercise.shoulderPress.exercise();

  static Exercise get _barbellCurl => DefaultExercise.barbellCurl.exercise(
        muscles: {Muscle.biceps: MuscleInvolvement.primary},
      );

  static Exercise get _bentOverRow => DefaultExercise.bentOverRow.exercise(
        muscles: {Muscle.trapezius: MuscleInvolvement.primary},
      );

  static Exercise get _frontSquat => DefaultExercise.frontSquat.exercise(
        muscles: {Muscle.hamstering: MuscleInvolvement.primary},
      );

  static Exercise get _inclineBenchPress =>
      DefaultExercise.inclineBenchPress.exercise();

  static Exercise get _powerClean => DefaultExercise.powerClean.exercise(
        muscles: {Muscle.glutes: MuscleInvolvement.primary},
      );

  static Exercise get _hexBarDeadlift =>
      DefaultExercise.hexBarDeadlift.exercise(
        muscles: {Muscle.glutes: MuscleInvolvement.primary},
      );

  static Exercise get _sumoDeadlift => DefaultExercise.sumoDeadlift.exercise(
        muscles: {Muscle.hamstering: MuscleInvolvement.primary},
      );

  static Exercise get _hipThrust => DefaultExercise.hipThrust.exercise(
        muscles: {Muscle.glutes: MuscleInvolvement.primary},
      );

  static Exercise get _romanianDeadlift =>
      DefaultExercise.romanianDeadlift.exercise(
        muscles: {Muscle.hamstering: MuscleInvolvement.primary},
      );

  static Exercise get _cleanAndJerk => DefaultExercise.cleanAndJerk.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );
  static Exercise get _snatch => DefaultExercise.snatch.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _clean => DefaultExercise.clean.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _barbellShrug => DefaultExercise.barbellShrug.exercise(
        muscles: {Muscle.trapezius: MuscleInvolvement.primary},
      );

  static Exercise get _closeGripBenchPress =>
      DefaultExercise.closeGripBenchPress.exercise(
        muscles: {Muscle.triceps: MuscleInvolvement.primary},
      );

  static Exercise get _declineBenchPress =>
      DefaultExercise.declineBenchPress.exercise(
        muscles: {Muscle.chest: MuscleInvolvement.primary},
      );

  static Exercise get _cleanAndPress => DefaultExercise.cleanAndPress.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _tBarRow => DefaultExercise.tBarRow.exercise(
        muscles: {Muscle.trapezius: MuscleInvolvement.primary},
      );

  static Exercise get _eZBarCurl => DefaultExercise.eZBarCurl.exercise(
        muscles: {Muscle.biceps: MuscleInvolvement.primary},
      );

  static Exercise get _lyingTricepsExtension =>
      DefaultExercise.lyingTricepsExtension.exercise(
        muscles: {Muscle.triceps: MuscleInvolvement.primary},
      );

  static Exercise get _seatedShoulderPress =>
      DefaultExercise.seatedShoulderPress.exercise(
        muscles: {Muscle.shoulders: MuscleInvolvement.primary},
      );

  static Exercise get _preacherCurl => DefaultExercise.preacherCurl.exercise(
        muscles: {Muscle.biceps: MuscleInvolvement.primary},
      );

  static Exercise get _rackPull => DefaultExercise.rackPull.exercise(
        muscles: {Muscle.glutes: MuscleInvolvement.primary},
      );
  static Exercise get _pendlayRow => DefaultExercise.pendlayRow.exercise(
        muscles: {Muscle.trapezius: MuscleInvolvement.primary},
      );

  static Exercise get _uprightRow => DefaultExercise.uprightRow.exercise(
        muscles: {Muscle.trapezius: MuscleInvolvement.primary},
      );
  static Exercise get _boxSquat => DefaultExercise.boxSquat.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _tricepExtension =>
      DefaultExercise.tricepExtension.exercise(
        muscles: {Muscle.triceps: MuscleInvolvement.primary},
      );

  static Exercise get _bulgarianSplitSquat =>
      DefaultExercise.bulgarianSplitSquat.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );
  static Exercise get _floorPress => DefaultExercise.floorPress.exercise(
        muscles: {Muscle.chest: MuscleInvolvement.primary},
      );

  static Exercise get _smithMachineBenchPress =>
      DefaultExercise.smithMachineBenchPress.exercise(
        muscles: {Muscle.chest: MuscleInvolvement.primary},
      );

  static Exercise get _goodMorning => DefaultExercise.goodMorning.exercise(
        muscles: {Muscle.glutes: MuscleInvolvement.primary},
      );

  static Exercise get _stiffLegDeadlift =>
      DefaultExercise.stiffLegDeadlift.exercise(
        muscles: {Muscle.hamstering: MuscleInvolvement.primary},
      );

  static Exercise get _barbellLunge => DefaultExercise.barbellLunge.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _zercherSquat => DefaultExercise.zercherSquat.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _smithMachineSquat =>
      DefaultExercise.smithMachineSquat.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _overheadSquat => DefaultExercise.overheadSquat.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _wristCurl => DefaultExercise.wristCurl.exercise(
        muscles: {Muscle.forearm: MuscleInvolvement.primary},
      );

  static Exercise get _thruster => DefaultExercise.thruster.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _pushJerk => DefaultExercise.pushJerk.exercise(
        muscles: {Muscle.shoulders: MuscleInvolvement.primary},
      );

  static Exercise get _powerSnatch => DefaultExercise.powerSnatch.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );
  static Exercise get _splitSquat => DefaultExercise.splitSquat.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _barbellCalfRaise =>
      DefaultExercise.barbellCalfRaise.exercise(
        muscles: {Muscle.calf: MuscleInvolvement.primary},
      );

  static Exercise get _reverseGripBenchPress =>
      DefaultExercise.reverseGripBenchPress.exercise(
        muscles: {Muscle.chest: MuscleInvolvement.primary},
      );

  static Exercise get _reverseWristCurl =>
      DefaultExercise.reverseWristCurl.exercise(
        muscles: {Muscle.forearm: MuscleInvolvement.primary},
      );

  static Exercise get _landmineSquat => DefaultExercise.landmineSquat.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _reverseBarbellCurl =>
      DefaultExercise.reverseBarbellCurl.exercise(
        muscles: {Muscle.biceps: MuscleInvolvement.primary},
      );

  static Exercise get _pausedBenchPress =>
      DefaultExercise.pausedBenchPress.exercise(
        muscles: {Muscle.chest: MuscleInvolvement.primary},
      );

  static Exercise get _barbellGluteBridge =>
      DefaultExercise.barbellGluteBridge.exercise(
        muscles: {Muscle.glutes: MuscleInvolvement.primary},
      );

  static Exercise get _barbellReverseLunge =>
      DefaultExercise.barbellReverseLunge.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _strictCurl => DefaultExercise.strictCurl.exercise(
        muscles: {Muscle.biceps: MuscleInvolvement.primary},
      );
  static Exercise get _deficitDeadlift =>
      DefaultExercise.deficitDeadlift.exercise(
        muscles: {Muscle.hamstering: MuscleInvolvement.primary},
      );

  static Exercise get _neckCurl => DefaultExercise.neckCurl.exercise(
        muscles: {Muscle.neck: MuscleInvolvement.primary},
      );

  static Exercise get _safetyBarSquat =>
      DefaultExercise.safetyBarSquat.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _barbellHackSquat =>
      DefaultExercise.barbellHackSquat.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _benchPinPress => DefaultExercise.benchPinPress.exercise(
        muscles: {Muscle.chest: MuscleInvolvement.primary},
      );

  static Exercise get _barbellFrontRaise =>
      DefaultExercise.barbellFrontRaise.exercise(
        muscles: {Muscle.shoulders: MuscleInvolvement.primary},
      );

  static Exercise get _behindTheNeckPress =>
      DefaultExercise.behindTheNeckPress.exercise(
        muscles: {Muscle.shoulders: MuscleInvolvement.primary},
      );

  static Exercise get _pauseSquat => DefaultExercise.pauseSquat.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _logPress => DefaultExercise.logPress.exercise(
        muscles: {Muscle.shoulders: MuscleInvolvement.primary},
      );

  static Exercise get _benchPull => DefaultExercise.benchPull.exercise(
        muscles: {Muscle.lattisimus: MuscleInvolvement.primary},
      );

  static Exercise get _cleanHighPull => DefaultExercise.cleanHighPull.exercise(
        muscles: {Muscle.shoulders: MuscleInvolvement.primary},
      );

  static Exercise get _singleLegRomanianDeadlift =>
      DefaultExercise.singleLegRomanianDeadlift.exercise(
        muscles: {Muscle.hamstering: MuscleInvolvement.primary},
      );

  static Exercise get _splitJerk => DefaultExercise.splitJerk.exercise(
        muscles: {Muscle.shoulders: MuscleInvolvement.primary},
      );

  static Exercise get _sumoSquat => DefaultExercise.sumoSquat.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _cleanPull => DefaultExercise.cleanPull.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );
  static Exercise get _yatesRow => DefaultExercise.yatesRow.exercise(
        muscles: {Muscle.lattisimus: MuscleInvolvement.primary},
      );

  static Exercise get _snatchDeadlift =>
      DefaultExercise.snatchDeadlift.exercise(
        muscles: {Muscle.hamstering: MuscleInvolvement.primary},
      );
  static Exercise get _hangPowerClean =>
      DefaultExercise.hangPowerClean.exercise(
        muscles: {Muscle.glutes: MuscleInvolvement.primary},
      );

  static Exercise get _barbellPullover =>
      DefaultExercise.barbellPullover.exercise(
        muscles: {Muscle.chest: MuscleInvolvement.primary},
      );

  static Exercise get _jeffersonDeadlift =>
      DefaultExercise.jeffersonDeadlift.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );
  static Exercise get _pauseDeadlift => DefaultExercise.pauseDeadlift.exercise(
        muscles: {Muscle.hamstering: MuscleInvolvement.primary},
      );

  static Exercise get _landminePress => DefaultExercise.landminePress.exercise(
        muscles: {Muscle.shoulders: MuscleInvolvement.primary},
      );

  static Exercise get _singleLegDeadlift =>
      DefaultExercise.singleLegDeadlift.exercise(
        muscles: {Muscle.hamstering: MuscleInvolvement.primary},
      );

  static Exercise get _wideGripBenchPress =>
      DefaultExercise.wideGripBenchPress.exercise(
        muscles: {Muscle.chest: MuscleInvolvement.primary},
      );

  static Exercise get _muscleSnatch => DefaultExercise.muscleSnatch.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _zPress => DefaultExercise.zPress.exercise(
        muscles: {Muscle.shoulders: MuscleInvolvement.primary},
      );
  static Exercise get _neckExtension => DefaultExercise.neckExtension.exercise(
        muscles: {Muscle.neck: MuscleInvolvement.primary},
      );

  static Exercise get _shoulderPinPress =>
      DefaultExercise.shoulderPinPress.exercise(
        muscles: {Muscle.shoulders: MuscleInvolvement.primary},
      );

  static Exercise get _vikingPress => DefaultExercise.vikingPress.exercise(
        muscles: {Muscle.shoulders: MuscleInvolvement.primary},
      );

  static Exercise get _spiderCurl => DefaultExercise.spiderCurl.exercise(
        muscles: {Muscle.biceps: MuscleInvolvement.primary},
      );

  static Exercise get _snatchPull => DefaultExercise.snatchPull.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );
  static Exercise get _jMPress => DefaultExercise.jMPress.exercise(
        muscles: {Muscle.triceps: MuscleInvolvement.primary},
      );
  static Exercise get _pinSquat => DefaultExercise.pinSquat.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _wallBall => DefaultExercise.wallBall.exercise(
        muscles: {Muscle.glutes: MuscleInvolvement.primary},
      );

  static Exercise get _cheatCurl => DefaultExercise.cheatCurl.exercise(
        muscles: {Muscle.biceps: MuscleInvolvement.primary},
      );

  static Exercise get _walkingLunge => DefaultExercise.walkingLunge.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _closeGripInclineBenchPress =>
      DefaultExercise.closeGripInclineBenchPress.exercise(
        muscles: {Muscle.triceps: MuscleInvolvement.primary},
      );
  static Exercise get _smithMachineShrug =>
      DefaultExercise.smithMachineShrug.exercise(
        muscles: {Muscle.trapezius: MuscleInvolvement.primary},
      );

  static Exercise get _oneArmLandminePress =>
      DefaultExercise.oneArmLandminePress.exercise(
        muscles: {Muscle.shoulders: MuscleInvolvement.primary},
      );

  static Exercise get _hexBarShrug => DefaultExercise.hexBarShrug.exercise(
        muscles: {Muscle.trapezius: MuscleInvolvement.primary},
      );

  static Exercise get _zercherDeadlift =>
      DefaultExercise.zercherDeadlift.exercise(
        muscles: {Muscle.hamstering: MuscleInvolvement.primary},
      );

  static Exercise get _bentArmBarbellPullover =>
      DefaultExercise.bentArmBarbellPullover.exercise(
        muscles: {Muscle.chest: MuscleInvolvement.primary},
      );

  static Exercise get _barbellPowerShrug =>
      DefaultExercise.barbellPowerShrug.exercise(
        muscles: {Muscle.trapezius: MuscleInvolvement.primary},
      );
  static Exercise get _halfSquat => DefaultExercise.halfSquat.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _hangSnatch => DefaultExercise.hangSnatch.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _meadowsRow => DefaultExercise.meadowsRow.exercise(
        muscles: {Muscle.lattisimus: MuscleInvolvement.primary},
      );
  static Exercise get _jeffersonSquat =>
      DefaultExercise.jeffersonSquat.exercise(
        muscles: {Muscle.quadriceps: MuscleInvolvement.primary},
      );

  static Exercise get _spotoPress => DefaultExercise.spotoPress.exercise(
        muscles: {Muscle.chest: MuscleInvolvement.primary},
      );

  static Exercise get _behindTheBackDeadlift =>
      DefaultExercise.behindTheBackDeadlift.exercise(
        muscles: {Muscle.hamstering: MuscleInvolvement.primary},
      );

  static Exercise get _behindTheBackBarbellShrug =>
      DefaultExercise.behindTheBackBarbellShrug.exercise(
        muscles: {Muscle.trapezius: MuscleInvolvement.primary},
      );
}
