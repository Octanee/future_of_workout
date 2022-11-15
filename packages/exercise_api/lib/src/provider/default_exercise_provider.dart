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
    _dumbbellBenchPress,
    _dumbbellCurl,
    _dumbbellShoulderPress,
    _inclineDumbbellBenchPress,
    _dumbbellRow,
    _dumbbellLateralRaise,
    _hammerCurl,
    _dumbbellFly,
    _dumbbellLunge,
    _gobletSquat,
    _dumbbellShrug,
    _dumbbellBulgarianSplitSquat,
    _dumbbellTricepsExtension,
    _dumbbellFrontRaise,
    _dumbbellConcentrationCurl,
    _arnoldPress,
    _inclineDumbbellFly,
    _dumbbellRomanianDeadlift,
    _inclineDumbbellCurl,
    _lyingDumbbellTricepsExtension,
    _dumbbellPullover,
    _dumbbellFloorPress,
    _dumbbellReverseFly,
    _chestSupportedDumbbellRow,
    _dumbbellTricepsKickback,
    _declineDumbbellBenchPress,
    _dumbbellSquat,
    _dumbbellCalfRaise,
    _dumbbellDeadlift,
    _dumbbellUprightRow,
    _seatedDumbbellShoulderPress,
    _dumbbellWristCurl,
    _closeGripDumbbellBenchPress,
    _oneArmDumbbellPreacherCurl,
    _inclineHammerCurl,
    _dumbbellSideBend,
    _dumbbellSnatch,
    _dumbbellBenchPull,
    _zottmanCurl,
    _renegadeRow,
    _tatePress,
    _dumbbellZPress,
    _bentOverDumbbellRow,
    _seatedDumbbellTricepsExtension,
    _seatedDumbbellCurl,
    _dumbbellFrontSquat,
    _dumbbellReverseWristCurl,
    _dumbbellPushPress,
    _dumbbellSplitSquat,
    _dumbbellFacePull,
    _dumbbellReverseCurl,
    _dumbbellInclineYRaise,
    _singleLegDumbbellDeadlift,
    _dumbbellCleanAndPress,
    _declineDumbbellFly,
    _dumbbellHighPull,
    _dumbbellHangClean,
    _dumbbellThruster,
    _dumbbellWalkingCalfRaise,
    _sledLegPress,
    _horizontalLegPress,
    _legExtension,
    _chestPress,
    _seatedLegCurl,
    _lyingLegCurl,
    _machineCalfRaise,
    _hackSquat,
    _machineShoulderPress,
    _machineChestFly,
    _verticalLegPress,
    _seatedCalfRaise,
    _machineRow,
    _hipAbduction,
    _hipAdduction,
    _seatedDipMachine,
    _machineSeatedCrunch,
    _standingLegCurl,
    _machineTricepsExtension,
    _machineBicepsCurl,
    _machineReverseFly,
    _beltSquat,
    _singleLegPress,
    _sledPressCalfRaise,
    _machineBackExtension,
    _machineLateralRaise,
    _machineShrug,
    _singleLegSeatedCalfRaise,
    _latPulldown,
    _tricepsPushdown,
    _seatedCableRow,
    _tricepsRopePushdown,
    _cableBicepsCurl,
    _cableLateralRaise,
    _cableFly,
    _facePull,
    _cableCrunch,
    _cablePullThrough,
    _oneArmCableBicepsCurl,
    _closeGripLatPulldown,
    _cableOverheadTricepsExtension,
    _cableReverseFly,
    _reverseGripLatPulldown,
    _straightArmPulldown,
    _cableWoodchopper,
    _reverseGripTricepsPushdown,
    _cableKickback,
    _oneArmLatPulldown,
    _cableUprightRow,
    _oneArmSeatedCableRow,
    _cableHammerCurl,
    _cableLegExtension,
    _cableShrug,
    _oneArmPulldown,
    _overheadCableCurl,
    _standingCableCrunch,
    _highPulleyCrunch,
    _inclineCableCurl,
    _lyingCableCurl,
    _pullUps,
    _pushUps,
    _dips,
    _chinUps,
    _sitUps,
    _bodyweightSquat,
    _muscleUps,
    _crunches,
    _singleLegSquat,
    _oneArmPushUps,
    _diamondPushUps,
    _handstandPushUps,
    _burpees,
    _neutralGripPullUps,
    _lunge,
    _oneArmPullUps,
    _pistolSquat,
    _backExtension,
    _hangingLegRaise,
    _gluteBridge,
    _invertedRow,
    _bodyweightCalfRaise,
    _russianTwist,
    _lyingLegRaise,
    _benchDips,
    _ringDips,
    _declinePushUp,
    _toesToBar,
    _absWheelRollout,
    _reverseLunge,
    _hangingKneeRaise,
    _declineSitUp,
    _nordicHamstringCurl,
    _squatJump,
    _declineCrunch,
    _closeGripPushUp,
    _gluteHamRaise,
    _inclinePushUp,
    _pikePushUp,
    _bicycleCrunch,
    _ringMuscleUps,
    _sideLunge,
    _reverseCrunches,
    _sissySquat,
    _flutterKicks,
    _donkeyCalfRaise,
    _mountainClimbers,
    _archerPushUps,
    _clapPullUp,
    _sideLegRaise,
    _gluteKickback,
    _sideCrunch,
    _floorHipAbduction,
    _superman,
    _reverseHyperextension,
    _hipExtension,
    _romanChairSideBend,
    _squatThrust,
    _scissorKicks,
    _floorHipExtension,
  ];

  static Exercise get _benchPress => DefaultExercise.benchPress.exercise(
        muscles: const {
          Muscle.chest: MuscleInvolvement.primary,
          Muscle.triceps: MuscleInvolvement.secondary,
          Muscle.frontShoulders: MuscleInvolvement.additional,
          Muscle.midShoulders: MuscleInvolvement.additional,
        },
        imagePath: 'assets/exercises/barbell_bench_press_start.svg',
        imagePathSecondary: 'assets/exercises/barbell_bench_press_end.svg',
        equipment: [Equipment.barbell],
      );

  static Exercise get _squat => DefaultExercise.squat.exercise(
        muscles: const {
          Muscle.quadriceps: MuscleInvolvement.primary,
          Muscle.glutes: MuscleInvolvement.secondary,
          Muscle.hamstering: MuscleInvolvement.additional,
          // TODO(Provider): Exercise muscles with involvement
        },
        imagePath: 'assets/exercises/squat_end.svg',
        imagePathSecondary: 'assets/exercises/squat_start.svg',
      );

  static Exercise get _deadlift => DefaultExercise.deadlift.exercise(
        muscles: const {
          Muscle.hamstering: MuscleInvolvement.primary,
          Muscle.glutes: MuscleInvolvement.secondary,
          Muscle.erectorSpinae: MuscleInvolvement.secondary,
          // TODO(Provider): Exercise muscles with involvement
        },
        imagePath: 'assets/exercises/deadlift_start.svg',
        imagePathSecondary: 'assets/exercises/deadlift_end.svg',
      );

  static Exercise get _shoulderPress => DefaultExercise.shoulderPress.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.triceps: MuscleInvolvement.additional,
          Muscle.chest: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _barbellCurl => DefaultExercise.barbellCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _bentOverRow => DefaultExercise.bentOverRow.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _frontSquat => DefaultExercise.frontSquat.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _inclineBenchPress =>
      DefaultExercise.inclineBenchPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _powerClean => DefaultExercise.powerClean.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _hexBarDeadlift =>
      DefaultExercise.hexBarDeadlift.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement 
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _sumoDeadlift => DefaultExercise.sumoDeadlift.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _hipThrust => DefaultExercise.hipThrust.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _romanianDeadlift =>
      DefaultExercise.romanianDeadlift.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _cleanAndJerk => DefaultExercise.cleanAndJerk.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _snatch => DefaultExercise.snatch.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _clean => DefaultExercise.clean.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _barbellShrug => DefaultExercise.barbellShrug.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _closeGripBenchPress =>
      DefaultExercise.closeGripBenchPress.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _declineBenchPress =>
      DefaultExercise.declineBenchPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _cleanAndPress => DefaultExercise.cleanAndPress.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _tBarRow => DefaultExercise.tBarRow.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _eZBarCurl => DefaultExercise.eZBarCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _lyingTricepsExtension =>
      DefaultExercise.lyingTricepsExtension.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _seatedShoulderPress =>
      DefaultExercise.seatedShoulderPress.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.trapezius: MuscleInvolvement.additional,
          Muscle.chest: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _preacherCurl => DefaultExercise.preacherCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _rackPull => DefaultExercise.rackPull.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _pendlayRow => DefaultExercise.pendlayRow.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _uprightRow => DefaultExercise.uprightRow.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _boxSquat => DefaultExercise.boxSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _tricepExtension =>
      DefaultExercise.tricepExtension.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _bulgarianSplitSquat =>
      DefaultExercise.bulgarianSplitSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _floorPress => DefaultExercise.floorPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _smithMachineBenchPress =>
      DefaultExercise.smithMachineBenchPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _goodMorning => DefaultExercise.goodMorning.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _stiffLegDeadlift =>
      DefaultExercise.stiffLegDeadlift.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _barbellLunge => DefaultExercise.barbellLunge.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _zercherSquat => DefaultExercise.zercherSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _smithMachineSquat =>
      DefaultExercise.smithMachineSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _overheadSquat => DefaultExercise.overheadSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _wristCurl => DefaultExercise.wristCurl.exercise(
        muscles: {
          Muscle.forearm: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _thruster => DefaultExercise.thruster.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _pushJerk => DefaultExercise.pushJerk.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.triceps: MuscleInvolvement.additional,
          Muscle.quadriceps: MuscleInvolvement.additional,
          Muscle.hamstering: MuscleInvolvement.additional,
          Muscle.calf: MuscleInvolvement.another,
          Muscle.neck: MuscleInvolvement.another,
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _powerSnatch => DefaultExercise.powerSnatch.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _splitSquat => DefaultExercise.splitSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _barbellCalfRaise =>
      DefaultExercise.barbellCalfRaise.exercise(
        muscles: {
          Muscle.calf: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _reverseGripBenchPress =>
      DefaultExercise.reverseGripBenchPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _reverseWristCurl =>
      DefaultExercise.reverseWristCurl.exercise(
        muscles: {
          Muscle.forearm: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _landmineSquat => DefaultExercise.landmineSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _reverseBarbellCurl =>
      DefaultExercise.reverseBarbellCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _pausedBenchPress =>
      DefaultExercise.pausedBenchPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _barbellGluteBridge =>
      DefaultExercise.barbellGluteBridge.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _barbellReverseLunge =>
      DefaultExercise.barbellReverseLunge.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _strictCurl => DefaultExercise.strictCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _deficitDeadlift =>
      DefaultExercise.deficitDeadlift.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _neckCurl => DefaultExercise.neckCurl.exercise(
        muscles: {
          Muscle.neck: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _safetyBarSquat =>
      DefaultExercise.safetyBarSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _barbellHackSquat =>
      DefaultExercise.barbellHackSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _benchPinPress => DefaultExercise.benchPinPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _barbellFrontRaise =>
      DefaultExercise.barbellFrontRaise.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.chest: MuscleInvolvement.additional,
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _behindTheNeckPress =>
      DefaultExercise.behindTheNeckPress.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.primary,
          Muscle.triceps: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _pauseSquat => DefaultExercise.pauseSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _logPress => DefaultExercise.logPress.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.triceps: MuscleInvolvement.additional,
          Muscle.quadriceps: MuscleInvolvement.additional,
          Muscle.hamstering: MuscleInvolvement.additional,
          Muscle.calf: MuscleInvolvement.another,
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _benchPull => DefaultExercise.benchPull.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _cleanHighPull => DefaultExercise.cleanHighPull.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          Muscle.hamstering: MuscleInvolvement.primary,
          Muscle.frontShoulders: MuscleInvolvement.secondary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _singleLegRomanianDeadlift =>
      DefaultExercise.singleLegRomanianDeadlift.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _splitJerk => DefaultExercise.splitJerk.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.triceps: MuscleInvolvement.additional,
          Muscle.quadriceps: MuscleInvolvement.additional,
          Muscle.hamstering: MuscleInvolvement.additional,
          Muscle.calf: MuscleInvolvement.another,
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _sumoSquat => DefaultExercise.sumoSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _cleanPull => DefaultExercise.cleanPull.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _yatesRow => DefaultExercise.yatesRow.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _snatchDeadlift =>
      DefaultExercise.snatchDeadlift.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _hangPowerClean =>
      DefaultExercise.hangPowerClean.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _barbellPullover =>
      DefaultExercise.barbellPullover.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _jeffersonDeadlift =>
      DefaultExercise.jeffersonDeadlift.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _pauseDeadlift => DefaultExercise.pauseDeadlift.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _landminePress => DefaultExercise.landminePress.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.chest: MuscleInvolvement.secondary,
          Muscle.triceps: MuscleInvolvement.additional,
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _singleLegDeadlift =>
      DefaultExercise.singleLegDeadlift.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _wideGripBenchPress =>
      DefaultExercise.wideGripBenchPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _muscleSnatch => DefaultExercise.muscleSnatch.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _zPress => DefaultExercise.zPress.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.abs: MuscleInvolvement.secondary,
          Muscle.triceps: MuscleInvolvement.additional,
          Muscle.obliques: MuscleInvolvement.another,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _neckExtension => DefaultExercise.neckExtension.exercise(
        muscles: {
          Muscle.neck: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _shoulderPinPress =>
      DefaultExercise.shoulderPinPress.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.triceps: MuscleInvolvement.additional,
          Muscle.chest: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _vikingPress => DefaultExercise.vikingPress.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.triceps: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _spiderCurl => DefaultExercise.spiderCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _snatchPull => DefaultExercise.snatchPull.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _jMPress => DefaultExercise.jMPress.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _pinSquat => DefaultExercise.pinSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _wallBall => DefaultExercise.wallBall.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _cheatCurl => DefaultExercise.cheatCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _walkingLunge => DefaultExercise.walkingLunge.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _closeGripInclineBenchPress =>
      DefaultExercise.closeGripInclineBenchPress.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _smithMachineShrug =>
      DefaultExercise.smithMachineShrug.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _oneArmLandminePress =>
      DefaultExercise.oneArmLandminePress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          Muscle.frontShoulders: MuscleInvolvement.secondary,
          Muscle.midShoulders: MuscleInvolvement.additional,
          Muscle.triceps: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _hexBarShrug => DefaultExercise.hexBarShrug.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _zercherDeadlift =>
      DefaultExercise.zercherDeadlift.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _bentArmBarbellPullover =>
      DefaultExercise.bentArmBarbellPullover.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _barbellPowerShrug =>
      DefaultExercise.barbellPowerShrug.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _halfSquat => DefaultExercise.halfSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _hangSnatch => DefaultExercise.hangSnatch.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _meadowsRow => DefaultExercise.meadowsRow.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );
  static Exercise get _jeffersonSquat =>
      DefaultExercise.jeffersonSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _spotoPress => DefaultExercise.spotoPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _behindTheBackDeadlift =>
      DefaultExercise.behindTheBackDeadlift.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _behindTheBackBarbellShrug =>
      DefaultExercise.behindTheBackBarbellShrug.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.barbell],
      );

  static Exercise get _dumbbellBenchPress =>
      DefaultExercise.dumbbellBenchPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellCurl => DefaultExercise.dumbbellCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellShoulderPress =>
      DefaultExercise.dumbbellShoulderPress.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.triceps: MuscleInvolvement.additional,
          Muscle.chest: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _inclineDumbbellBenchPress =>
      DefaultExercise.inclineDumbbellBenchPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellRow => DefaultExercise.dumbbellRow.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellLateralRaise =>
      DefaultExercise.dumbbellLateralRaise.exercise(
        muscles: {
          Muscle.midShoulders: MuscleInvolvement.primary,
          Muscle.frontShoulders: MuscleInvolvement.secondary,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _hammerCurl => DefaultExercise.hammerCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellFly => DefaultExercise.dumbbellFly.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellLunge => DefaultExercise.dumbbellLunge.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _gobletSquat => DefaultExercise.gobletSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellShrug => DefaultExercise.dumbbellShrug.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellBulgarianSplitSquat =>
      DefaultExercise.dumbbellBulgarianSplitSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );
  static Exercise get _dumbbellTricepsExtension =>
      DefaultExercise.dumbbellTricepsExtension.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellFrontRaise =>
      DefaultExercise.dumbbellFrontRaise.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.chest: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellConcentrationCurl =>
      DefaultExercise.dumbbellConcentrationCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );
  static Exercise get _arnoldPress => DefaultExercise.arnoldPress.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.primary,
          Muscle.triceps: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _inclineDumbbellFly =>
      DefaultExercise.inclineDumbbellFly.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellRomanianDeadlift =>
      DefaultExercise.dumbbellRomanianDeadlift.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _inclineDumbbellCurl =>
      DefaultExercise.inclineDumbbellCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _lyingDumbbellTricepsExtension =>
      DefaultExercise.lyingDumbbellTricepsExtension.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellPullover =>
      DefaultExercise.dumbbellPullover.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellFloorPress =>
      DefaultExercise.dumbbellFloorPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellReverseFly =>
      DefaultExercise.dumbbellReverseFly.exercise(
        muscles: {
          Muscle.backShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.additional,
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _chestSupportedDumbbellRow =>
      DefaultExercise.chestSupportedDumbbellRow.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellTricepsKickback =>
      DefaultExercise.dumbbellTricepsKickback.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _declineDumbbellBenchPress =>
      DefaultExercise.declineDumbbellBenchPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellSquat => DefaultExercise.dumbbellSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellCalfRaise =>
      DefaultExercise.dumbbellCalfRaise.exercise(
        muscles: {
          Muscle.calf: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellDeadlift =>
      DefaultExercise.dumbbellDeadlift.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellUprightRow =>
      DefaultExercise.dumbbellUprightRow.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.primary,
          Muscle.biceps: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _seatedDumbbellShoulderPress =>
      DefaultExercise.seatedDumbbellShoulderPress.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.primary,
          Muscle.chest: MuscleInvolvement.additional,
          Muscle.triceps: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellWristCurl =>
      DefaultExercise.dumbbellWristCurl.exercise(
        muscles: {
          Muscle.forearm: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _closeGripDumbbellBenchPress =>
      DefaultExercise.closeGripDumbbellBenchPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _oneArmDumbbellPreacherCurl =>
      DefaultExercise.oneArmDumbbellPreacherCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _inclineHammerCurl =>
      DefaultExercise.inclineHammerCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellSideBend =>
      DefaultExercise.dumbbellSideBend.exercise(
        muscles: {
          Muscle.obliques: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellSnatch =>
      DefaultExercise.dumbbellSnatch.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellBenchPull =>
      DefaultExercise.dumbbellBenchPull.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _zottmanCurl => DefaultExercise.zottmanCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _renegadeRow => DefaultExercise.renegadeRow.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _tatePress => DefaultExercise.tatePress.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellZPress =>
      DefaultExercise.dumbbellZPress.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _bentOverDumbbellRow =>
      DefaultExercise.bentOverDumbbellRow.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _seatedDumbbellTricepsExtension =>
      DefaultExercise.seatedDumbbellTricepsExtension.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _seatedDumbbellCurl =>
      DefaultExercise.seatedDumbbellCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellFrontSquat =>
      DefaultExercise.dumbbellFrontSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellReverseWristCurl =>
      DefaultExercise.dumbbellReverseWristCurl.exercise(
        muscles: {
          Muscle.forearm: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellPushPress =>
      DefaultExercise.dumbbellPushPress.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.triceps: MuscleInvolvement.additional,
          Muscle.hamstering: MuscleInvolvement.additional,
          Muscle.quadriceps: MuscleInvolvement.additional,
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellSplitSquat =>
      DefaultExercise.dumbbellSplitSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellFacePull =>
      DefaultExercise.dumbbellFacePull.exercise(
        muscles: {
          Muscle.backShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.biceps: MuscleInvolvement.additional,
          Muscle.trapezius: MuscleInvolvement.additional,
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellReverseCurl =>
      DefaultExercise.dumbbellReverseCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellInclineYRaise =>
      DefaultExercise.dumbbellInclineYRaise.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _singleLegDumbbellDeadlift =>
      DefaultExercise.singleLegDumbbellDeadlift.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellCleanAndPress =>
      DefaultExercise.dumbbellCleanAndPress.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _declineDumbbellFly =>
      DefaultExercise.declineDumbbellFly.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellHighPull =>
      DefaultExercise.dumbbellHighPull.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          Muscle.quadriceps: MuscleInvolvement.additional,
          Muscle.frontShoulders: MuscleInvolvement.additional,
          Muscle.midShoulders: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellHangClean =>
      DefaultExercise.dumbbellHangClean.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellThruster =>
      DefaultExercise.dumbbellThruster.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _dumbbellWalkingCalfRaise =>
      DefaultExercise.dumbbellWalkingCalfRaise.exercise(
        muscles: {
          Muscle.calf: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.dumbell],
      );

  static Exercise get _sledLegPress => DefaultExercise.sledLegPress.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _horizontalLegPress =>
      DefaultExercise.horizontalLegPress.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _legExtension => DefaultExercise.legExtension.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _chestPress => DefaultExercise.chestPress.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _seatedLegCurl => DefaultExercise.seatedLegCurl.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _lyingLegCurl => DefaultExercise.lyingLegCurl.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _machineCalfRaise =>
      DefaultExercise.machineCalfRaise.exercise(
        muscles: {
          Muscle.calf: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _hackSquat => DefaultExercise.hackSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _machineShoulderPress =>
      DefaultExercise.machineShoulderPress.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.midShoulders: MuscleInvolvement.secondary,
          Muscle.triceps: MuscleInvolvement.additional,
          Muscle.chest: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _machineChestFly =>
      DefaultExercise.machineChestFly.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _verticalLegPress =>
      DefaultExercise.verticalLegPress.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _seatedCalfRaise =>
      DefaultExercise.seatedCalfRaise.exercise(
        muscles: {
          Muscle.calf: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _machineRow => DefaultExercise.machineRow.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _hipAbduction => DefaultExercise.hipAbduction.exercise(
        muscles: {
          Muscle.abductors: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _hipAdduction => DefaultExercise.hipAdduction.exercise(
        muscles: {
          Muscle.adductors: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _seatedDipMachine =>
      DefaultExercise.seatedDipMachine.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _machineSeatedCrunch =>
      DefaultExercise.machineSeatedCrunch.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _standingLegCurl =>
      DefaultExercise.standingLegCurl.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _machineTricepsExtension =>
      DefaultExercise.machineTricepsExtension.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _machineBicepsCurl =>
      DefaultExercise.machineBicepsCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _machineReverseFly =>
      DefaultExercise.machineReverseFly.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _beltSquat => DefaultExercise.beltSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _singleLegPress =>
      DefaultExercise.singleLegPress.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _sledPressCalfRaise =>
      DefaultExercise.sledPressCalfRaise.exercise(
        muscles: {
          Muscle.calf: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _machineBackExtension =>
      DefaultExercise.machineBackExtension.exercise(
        muscles: {
          Muscle.erectorSpinae: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _machineLateralRaise =>
      DefaultExercise.machineLateralRaise.exercise(
        muscles: {
          Muscle.midShoulders: MuscleInvolvement.primary,
          Muscle.frontShoulders: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _machineShrug => DefaultExercise.machineShrug.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _singleLegSeatedCalfRaise =>
      DefaultExercise.singleLegSeatedCalfRaise.exercise(
        muscles: {
          Muscle.calf: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.machine],
      );

  static Exercise get _latPulldown => DefaultExercise.latPulldown.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _tricepsPushdown =>
      DefaultExercise.tricepsPushdown.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _seatedCableRow =>
      DefaultExercise.seatedCableRow.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _tricepsRopePushdown =>
      DefaultExercise.tricepsRopePushdown.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _cableBicepsCurl =>
      DefaultExercise.cableBicepsCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _cableLateralRaise =>
      DefaultExercise.cableLateralRaise.exercise(
        muscles: {
          Muscle.midShoulders: MuscleInvolvement.primary,
          Muscle.frontShoulders: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _cableFly => DefaultExercise.cableFly.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _facePull => DefaultExercise.facePull.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _cableCrunch => DefaultExercise.cableCrunch.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          Muscle.obliques: MuscleInvolvement.additional,
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _cablePullThrough =>
      DefaultExercise.cablePullThrough.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _oneArmCableBicepsCurl =>
      DefaultExercise.oneArmCableBicepsCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _closeGripLatPulldown =>
      DefaultExercise.closeGripLatPulldown.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _cableOverheadTricepsExtension =>
      DefaultExercise.cableOverheadTricepsExtension.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _cableReverseFly =>
      DefaultExercise.cableReverseFly.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _reverseGripLatPulldown =>
      DefaultExercise.reverseGripLatPulldown.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _straightArmPulldown =>
      DefaultExercise.straightArmPulldown.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _cableWoodchopper =>
      DefaultExercise.cableWoodchopper.exercise(
        muscles: {
          Muscle.obliques: MuscleInvolvement.primary,
          Muscle.abductors: MuscleInvolvement.another,
          Muscle.adductors: MuscleInvolvement.another,
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _reverseGripTricepsPushdown =>
      DefaultExercise.reverseGripTricepsPushdown.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _cableKickback => DefaultExercise.cableKickback.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _oneArmLatPulldown =>
      DefaultExercise.oneArmLatPulldown.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _cableUprightRow =>
      DefaultExercise.cableUprightRow.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _oneArmSeatedCableRow =>
      DefaultExercise.oneArmSeatedCableRow.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _cableHammerCurl =>
      DefaultExercise.cableHammerCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _cableLegExtension =>
      DefaultExercise.cableLegExtension.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _cableShrug => DefaultExercise.cableShrug.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _oneArmPulldown =>
      DefaultExercise.oneArmPulldown.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _overheadCableCurl =>
      DefaultExercise.overheadCableCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _standingCableCrunch =>
      DefaultExercise.standingCableCrunch.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _highPulleyCrunch =>
      DefaultExercise.highPulleyCrunch.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _inclineCableCurl =>
      DefaultExercise.inclineCableCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _lyingCableCurl =>
      DefaultExercise.lyingCableCurl.exercise(
        muscles: {
          Muscle.biceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
        equipment: [Equipment.cable],
      );

  static Exercise get _pullUps => DefaultExercise.pullUps.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _pushUps => DefaultExercise.pushUps.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _dips => DefaultExercise.dips.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _chinUps => DefaultExercise.chinUps.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _sitUps => DefaultExercise.sitUps.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _bodyweightSquat =>
      DefaultExercise.bodyweightSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _muscleUps => DefaultExercise.muscleUps.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,

          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _crunches => DefaultExercise.crunches.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _singleLegSquat =>
      DefaultExercise.singleLegSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _oneArmPushUps => DefaultExercise.oneArmPushUps.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _diamondPushUps =>
      DefaultExercise.diamondPushUps.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _handstandPushUps =>
      DefaultExercise.handstandPushUps.exercise(
        muscles: {
          Muscle.midShoulders: MuscleInvolvement.primary,
          Muscle.frontShoulders: MuscleInvolvement.secondary,
          Muscle.triceps: MuscleInvolvement.secondary,
          Muscle.abs: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
      );

  static Exercise get _burpees => DefaultExercise.burpees.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,

          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _neutralGripPullUps =>
      DefaultExercise.neutralGripPullUps.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _lunge => DefaultExercise.lunge.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _oneArmPullUps => DefaultExercise.oneArmPullUps.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _pistolSquat => DefaultExercise.pistolSquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _backExtension => DefaultExercise.backExtension.exercise(
        muscles: {
          Muscle.erectorSpinae: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _hangingLegRaise =>
      DefaultExercise.hangingLegRaise.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _gluteBridge => DefaultExercise.gluteBridge.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _invertedRow => DefaultExercise.invertedRow.exercise(
        muscles: {
          Muscle.trapezius: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _bodyweightCalfRaise =>
      DefaultExercise.bodyweightCalfRaise.exercise(
        muscles: {
          Muscle.calf: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _russianTwist => DefaultExercise.russianTwist.exercise(
        muscles: {
          Muscle.obliques: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _lyingLegRaise => DefaultExercise.lyingLegRaise.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _benchDips => DefaultExercise.benchDips.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _ringDips => DefaultExercise.ringDips.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _declinePushUp => DefaultExercise.declinePushUp.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _toesToBar => DefaultExercise.toesToBar.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _absWheelRollout =>
      DefaultExercise.absWheelRollout.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _reverseLunge => DefaultExercise.reverseLunge.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _hangingKneeRaise =>
      DefaultExercise.hangingKneeRaise.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _declineSitUp => DefaultExercise.declineSitUp.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _nordicHamstringCurl =>
      DefaultExercise.nordicHamstringCurl.exercise(
        muscles: {
          Muscle.hamstering: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _squatJump => DefaultExercise.squatJump.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _declineCrunch => DefaultExercise.declineCrunch.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _closeGripPushUp =>
      DefaultExercise.closeGripPushUp.exercise(
        muscles: {
          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _gluteHamRaise => DefaultExercise.gluteHamRaise.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _inclinePushUp => DefaultExercise.inclinePushUp.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _pikePushUp => DefaultExercise.pikePushUp.exercise(
        muscles: {
          Muscle.frontShoulders: MuscleInvolvement.primary,
          Muscle.triceps: MuscleInvolvement.secondary,
          Muscle.midShoulders: MuscleInvolvement.additional,
          Muscle.serratus: MuscleInvolvement.another,
        },
      );

  static Exercise get _bicycleCrunch => DefaultExercise.bicycleCrunch.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _ringMuscleUps => DefaultExercise.ringMuscleUps.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,

          Muscle.triceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _sideLunge => DefaultExercise.sideLunge.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _reverseCrunches =>
      DefaultExercise.reverseCrunches.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _sissySquat => DefaultExercise.sissySquat.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _flutterKicks => DefaultExercise.flutterKicks.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _donkeyCalfRaise =>
      DefaultExercise.donkeyCalfRaise.exercise(
        muscles: {
          Muscle.calf: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _mountainClimbers =>
      DefaultExercise.mountainClimbers.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _archerPushUps => DefaultExercise.archerPushUps.exercise(
        muscles: {
          Muscle.chest: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _clapPullUp => DefaultExercise.clapPullUp.exercise(
        muscles: {
          Muscle.lattisimus: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _sideLegRaise => DefaultExercise.sideLegRaise.exercise(
        muscles: {
          Muscle.abductors: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _gluteKickback => DefaultExercise.gluteKickback.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _sideCrunch => DefaultExercise.sideCrunch.exercise(
        muscles: {
          Muscle.obliques: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _floorHipAbduction =>
      DefaultExercise.floorHipAbduction.exercise(
        muscles: {
          Muscle.abductors: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _superman => DefaultExercise.superman.exercise(
        muscles: {
          Muscle.erectorSpinae: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _reverseHyperextension =>
      DefaultExercise.reverseHyperextension.exercise(
        muscles: {
          Muscle.erectorSpinae: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _hipExtension => DefaultExercise.hipExtension.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _romanChairSideBend =>
      DefaultExercise.romanChairSideBend.exercise(
        muscles: {
          Muscle.obliques: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _squatThrust => DefaultExercise.squatThrust.exercise(
        muscles: {
          Muscle.quadriceps: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _scissorKicks => DefaultExercise.scissorKicks.exercise(
        muscles: {
          Muscle.abs: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );

  static Exercise get _floorHipExtension =>
      DefaultExercise.floorHipExtension.exercise(
        muscles: {
          Muscle.glutes: MuscleInvolvement.primary,
          // TODO(Provider): Exercise muscles with involvement
        },
      );
}
