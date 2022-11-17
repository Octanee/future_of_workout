// ignore_for_file: todo
import 'package:collection/collection.dart';
import 'package:exercise_api/exercise_api.dart';

part 'instructions_en.dart';
part 'instructions_pl.dart';

/// The interface for a instructions of exercises.
abstract class Instructions {
  /// Return a instance of Instruction
  /// for given language code.
  ///
  /// Supported languages:
  /// `en`, 'pl.
  static Instructions getInstructionsByLanguageCode({
    required String languageCode,
  }) {
    switch (languageCode) {
      case 'en':
        return InstructionsEn();
      case 'pl':
        return InstructionsPl();
    }
    return InstructionsEn();
  }

  /// Get instructions by exercise id.
  List<String> get({required String id}) {
    final exercise = DefaultExercise.values
        .firstWhereOrNull((element) => element.name == id);

    switch (exercise) {
      case null:
        return [];
      case DefaultExercise.benchPress:
        return _benchPress;
      case DefaultExercise.squat:
        return _squat;
      case DefaultExercise.deadlift:
        return _deadlift;
      case DefaultExercise.shoulderPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.barbellCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.bentOverRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.frontSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.inclineBenchPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.powerClean:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.hexBarDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.sumoDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.hipThrust:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.romanianDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.snatch:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.clean:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.barbellShrug:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.closeGripBenchPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.declineBenchPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.tBarRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.eZBarCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.lyingTricepsExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.seatedShoulderPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.preacherCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cleanAndJerk:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cleanAndPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.rackPull:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.pendlayRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.uprightRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.boxSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.tricepExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.bulgarianSplitSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.floorPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.smithMachineBenchPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.goodMorning:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.stiffLegDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.barbellLunge:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.zercherSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.smithMachineSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.overheadSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.wristCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.thruster:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.pushJerk:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.powerSnatch:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.splitSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.barbellCalfRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.reverseGripBenchPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.reverseWristCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.landmineSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.reverseBarbellCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.pausedBenchPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.barbellGluteBridge:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.barbellReverseLunge:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.strictCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.deficitDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.neckCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.safetyBarSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.barbellHackSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.benchPinPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.barbellFrontRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.behindTheNeckPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.pauseSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.logPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.benchPull:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cleanHighPull:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.singleLegRomanianDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.splitJerk:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.sumoSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cleanPull:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.yatesRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.snatchDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.hangPowerClean:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.barbellPullover:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.jeffersonDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.pauseDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.landminePress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.singleLegDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.wideGripBenchPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.muscleSnatch:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.zPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.neckExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.shoulderPinPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.vikingPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.spiderCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.snatchPull:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.jMPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.pinSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.wallBall:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cheatCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.walkingLunge:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.closeGripInclineBenchPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.smithMachineShrug:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.oneArmLandminePress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.hexBarShrug:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.zercherDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.bentArmBarbellPullover:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.barbellPowerShrug:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.halfSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.hangSnatch:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.meadowsRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.jeffersonSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.spotoPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.behindTheBackDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.behindTheBackBarbellShrug:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellBenchPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellShoulderPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.inclineDumbbellBenchPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellLateralRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.hammerCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellFly:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellLunge:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.gobletSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellShrug:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellBulgarianSplitSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellTricepsExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellFrontRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellConcentrationCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.arnoldPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.inclineDumbbellFly:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellRomanianDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.inclineDumbbellCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.lyingDumbbellTricepsExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellPullover:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellFloorPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellReverseFly:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.chestSupportedDumbbellRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellTricepsKickback:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.declineDumbbellBenchPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellCalfRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellUprightRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.seatedDumbbellShoulderPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellWristCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.closeGripDumbbellBenchPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.oneArmDumbbellPreacherCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.inclineHammerCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellSideBend:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellSnatch:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellBenchPull:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.zottmanCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.renegadeRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.tatePress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellZPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.bentOverDumbbellRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.seatedDumbbellTricepsExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.seatedDumbbellCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellFrontSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellReverseWristCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellPushPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellSplitSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellFacePull:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellReverseCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellInclineYRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.singleLegDumbbellDeadlift:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellCleanAndPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.declineDumbbellFly:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellHighPull:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellHangClean:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellThruster:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dumbbellWalkingCalfRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.sledLegPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.horizontalLegPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.legExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.chestPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.seatedLegCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.lyingLegCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.machineCalfRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.hackSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.machineShoulderPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.machineChestFly:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.verticalLegPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.seatedCalfRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.machineRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.hipAbduction:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.hipAdduction:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.seatedDipMachine:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.machineSeatedCrunch:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.standingLegCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.machineTricepsExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.machineBicepsCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.machineReverseFly:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.beltSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.singleLegPress:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.sledPressCalfRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.machineBackExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.machineLateralRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.machineShrug:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.singleLegSeatedCalfRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.latPulldown:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.tricepsPushdown:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.seatedCableRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.tricepsRopePushdown:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cableBicepsCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cableLateralRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cableFly:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.facePull:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cableCrunch:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cablePullThrough:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.oneArmCableBicepsCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.closeGripLatPulldown:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cableOverheadTricepsExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cableReverseFly:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.reverseGripLatPulldown:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.straightArmPulldown:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cableWoodchopper:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.reverseGripTricepsPushdown:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cableKickback:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.oneArmLatPulldown:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cableUprightRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.oneArmSeatedCableRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cableHammerCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cableLegExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.cableShrug:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.oneArmPulldown:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.overheadCableCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.standingCableCrunch:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.highPulleyCrunch:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.inclineCableCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.lyingCableCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.pullUps:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.pushUps:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.dips:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.chinUps:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.sitUps:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.bodyweightSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.muscleUps:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.crunches:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.singleLegSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.oneArmPushUps:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.diamondPushUps:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.handstandPushUps:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.burpees:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.neutralGripPullUps:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.lunge:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.oneArmPullUps:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.pistolSquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.backExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.hangingLegRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.gluteBridge:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.invertedRow:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.bodyweightCalfRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.russianTwist:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.lyingLegRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.benchDips:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.ringDips:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.declinePushUp:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.toesToBar:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.absWheelRollout:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.reverseLunge:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.hangingKneeRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.declineSitUp:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.nordicHamstringCurl:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.squatJump:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.declineCrunch:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.closeGripPushUp:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.gluteHamRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.inclinePushUp:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.pikePushUp:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.bicycleCrunch:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.ringMuscleUps:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.sideLunge:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.reverseCrunches:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.sissySquat:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.flutterKicks:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.donkeyCalfRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.mountainClimbers:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.archerPushUps:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.clapPullUp:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.sideLegRaise:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.gluteKickback:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.sideCrunch:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.floorHipAbduction:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.superman:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.reverseHyperextension:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.hipExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.romanChairSideBend:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.squatThrust:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.scissorKicks:
        // TODO(Exercise): Create instructions for exercises
        return [];

      case DefaultExercise.floorHipExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];
    }
  }

  List<String> get _benchPress;

  List<String> get _deadlift;

  List<String> get _squat;
}
