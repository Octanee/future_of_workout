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

      case DefaultExercise.barbellCurl:

      case DefaultExercise.bentOverRow:

      case DefaultExercise.frontSquat:

      case DefaultExercise.inclineBenchPress:

      case DefaultExercise.powerClean:

      case DefaultExercise.hexBarDeadlift:

      case DefaultExercise.sumoDeadlift:

      case DefaultExercise.hipThrust:

      case DefaultExercise.romanianDeadlift:

      case DefaultExercise.snatch:

      case DefaultExercise.clean:

      case DefaultExercise.barbellShrug:

      case DefaultExercise.closeGripBenchPress:

      case DefaultExercise.declineBenchPress:

      case DefaultExercise.tBarRow:

      case DefaultExercise.eZBarCurl:

      case DefaultExercise.lyingTricepsExtension:

      case DefaultExercise.seatedShoulderPress:

      case DefaultExercise.preacherCurl:

      case DefaultExercise.cleanAndJerk:

      case DefaultExercise.cleanAndPress:

      case DefaultExercise.rackPull:

      case DefaultExercise.pendlayRow:

      case DefaultExercise.uprightRow:

      case DefaultExercise.boxSquat:

      case DefaultExercise.tricepExtension:

      case DefaultExercise.bulgarianSplitSquat:

      case DefaultExercise.floorPress:

      case DefaultExercise.smithMachineBenchPress:

      case DefaultExercise.goodMorning:

      case DefaultExercise.stiffLegDeadlift:

      case DefaultExercise.barbellLunge:

      case DefaultExercise.zercherSquat:

      case DefaultExercise.smithMachineSquat:

      case DefaultExercise.overheadSquat:

      case DefaultExercise.wristCurl:

      case DefaultExercise.thruster:

      case DefaultExercise.pushJerk:

      case DefaultExercise.powerSnatch:

      case DefaultExercise.splitSquat:

      case DefaultExercise.barbellCalfRaise:

      case DefaultExercise.reverseGripBenchPress:

      case DefaultExercise.reverseWristCurl:

      case DefaultExercise.landmineSquat:

      case DefaultExercise.reverseBarbellCurl:

      case DefaultExercise.pausedBenchPress:

      case DefaultExercise.barbellGluteBridge:

      case DefaultExercise.barbellReverseLunge:

      case DefaultExercise.strictCurl:

      case DefaultExercise.deficitDeadlift:

      case DefaultExercise.neckCurl:

      case DefaultExercise.safetyBarSquat:

      case DefaultExercise.barbellHackSquat:

      case DefaultExercise.benchPinPress:

      case DefaultExercise.barbellFrontRaise:

      case DefaultExercise.behindTheNeckPress:

      case DefaultExercise.pauseSquat:

      case DefaultExercise.logPress:

      case DefaultExercise.benchPull:

      case DefaultExercise.cleanHighPull:

      case DefaultExercise.singleLegRomanianDeadlift:

      case DefaultExercise.splitJerk:

      case DefaultExercise.sumoSquat:

      case DefaultExercise.cleanPull:

      case DefaultExercise.yatesRow:

      case DefaultExercise.snatchDeadlift:

      case DefaultExercise.hangPowerClean:

      case DefaultExercise.barbellPullover:

      case DefaultExercise.jeffersonDeadlift:

      case DefaultExercise.pauseDeadlift:

      case DefaultExercise.landminePress:

      case DefaultExercise.singleLegDeadlift:

      case DefaultExercise.wideGripBenchPress:

      case DefaultExercise.muscleSnatch:

      case DefaultExercise.zPress:

      case DefaultExercise.neckExtension:

      case DefaultExercise.shoulderPinPress:

      case DefaultExercise.vikingPress:

      case DefaultExercise.spiderCurl:

      case DefaultExercise.snatchPull:

      case DefaultExercise.jMPress:

      case DefaultExercise.pinSquat:

      case DefaultExercise.wallBall:

      case DefaultExercise.cheatCurl:

      case DefaultExercise.walkingLunge:

      case DefaultExercise.closeGripInclineBenchPress:

      case DefaultExercise.smithMachineShrug:

      case DefaultExercise.oneArmLandminePress:

      case DefaultExercise.hexBarShrug:

      case DefaultExercise.zercherDeadlift:

      case DefaultExercise.bentArmBarbellPullover:

      case DefaultExercise.barbellPowerShrug:

      case DefaultExercise.halfSquat:

      case DefaultExercise.hangSnatch:

      case DefaultExercise.meadowsRow:

      case DefaultExercise.jeffersonSquat:

      case DefaultExercise.spotoPress:

      case DefaultExercise.behindTheBackDeadlift:

      case DefaultExercise.behindTheBackBarbellShrug:

      case DefaultExercise.dumbbellBenchPress:

      case DefaultExercise.dumbbellCurl:

      case DefaultExercise.dumbbellShoulderPress:

      case DefaultExercise.inclineDumbbellBenchPress:

      case DefaultExercise.dumbbellRow:

      case DefaultExercise.dumbbellLateralRaise:

      case DefaultExercise.hammerCurl:

      case DefaultExercise.dumbbellFly:

      case DefaultExercise.dumbbellLunge:

      case DefaultExercise.gobletSquat:

      case DefaultExercise.dumbbellShrug:

      case DefaultExercise.dumbbellBulgarianSplitSquat:

      case DefaultExercise.dumbbellTricepsExtension:

      case DefaultExercise.dumbbellFrontRaise:

      case DefaultExercise.dumbbellConcentrationCurl:

      case DefaultExercise.arnoldPress:

      case DefaultExercise.inclineDumbbellFly:

      case DefaultExercise.dumbbellRomanianDeadlift:

      case DefaultExercise.inclineDumbbellCurl:

      case DefaultExercise.lyingDumbbellTricepsExtension:

      case DefaultExercise.dumbbellPullover:

      case DefaultExercise.dumbbellFloorPress:

      case DefaultExercise.dumbbellReverseFly:

      case DefaultExercise.chestSupportedDumbbellRow:

      case DefaultExercise.dumbbellTricepsKickback:

      case DefaultExercise.declineDumbbellBenchPress:

      case DefaultExercise.dumbbellSquat:

      case DefaultExercise.dumbbellCalfRaise:

      case DefaultExercise.dumbbellDeadlift:

      case DefaultExercise.dumbbellUprightRow:

      case DefaultExercise.seatedDumbbellShoulderPress:

      case DefaultExercise.dumbbellWristCurl:

      case DefaultExercise.closeGripDumbbellBenchPress:

      case DefaultExercise.oneArmDumbbellPreacherCurl:

      case DefaultExercise.inclineHammerCurl:

      case DefaultExercise.dumbbellSideBend:

      case DefaultExercise.dumbbellSnatch:

      case DefaultExercise.dumbbellBenchPull:

      case DefaultExercise.zottmanCurl:

      case DefaultExercise.renegadeRow:

      case DefaultExercise.tatePress:

      case DefaultExercise.dumbbellZPress:

      case DefaultExercise.bentOverDumbbellRow:

      case DefaultExercise.seatedDumbbellTricepsExtension:

      case DefaultExercise.seatedDumbbellCurl:

      case DefaultExercise.dumbbellFrontSquat:

      case DefaultExercise.dumbbellReverseWristCurl:

      case DefaultExercise.dumbbellPushPress:

      case DefaultExercise.dumbbellSplitSquat:

      case DefaultExercise.dumbbellFacePull:

      case DefaultExercise.dumbbellReverseCurl:

      case DefaultExercise.dumbbellInclineYRaise:

      case DefaultExercise.singleLegDumbbellDeadlift:

      case DefaultExercise.dumbbellCleanAndPress:

      case DefaultExercise.declineDumbbellFly:

      case DefaultExercise.dumbbellHighPull:

      case DefaultExercise.dumbbellHangClean:

      case DefaultExercise.dumbbellThruster:

      case DefaultExercise.dumbbellWalkingCalfRaise:

      case DefaultExercise.sledLegPress:

      case DefaultExercise.horizontalLegPress:

      case DefaultExercise.legExtension:

      case DefaultExercise.chestPress:

      case DefaultExercise.seatedLegCurl:

      case DefaultExercise.lyingLegCurl:

      case DefaultExercise.machineCalfRaise:

      case DefaultExercise.hackSquat:

      case DefaultExercise.machineShoulderPress:

      case DefaultExercise.machineChestFly:

      case DefaultExercise.verticalLegPress:

      case DefaultExercise.seatedCalfRaise:

      case DefaultExercise.machineRow:

      case DefaultExercise.hipAbduction:

      case DefaultExercise.hipAdduction:

      case DefaultExercise.seatedDipMachine:

      case DefaultExercise.machineSeatedCrunch:

      case DefaultExercise.standingLegCurl:

      case DefaultExercise.machineTricepsExtension:

      case DefaultExercise.machineBicepsCurl:

      case DefaultExercise.machineReverseFly:

      case DefaultExercise.beltSquat:

      case DefaultExercise.singleLegPress:

      case DefaultExercise.sledPressCalfRaise:

      case DefaultExercise.machineBackExtension:

      case DefaultExercise.machineLateralRaise:

      case DefaultExercise.machineShrug:

      case DefaultExercise.singleLegSeatedCalfRaise:

      case DefaultExercise.latPulldown:

      case DefaultExercise.tricepsPushdown:

      case DefaultExercise.seatedCableRow:

      case DefaultExercise.tricepsRopePushdown:

      case DefaultExercise.cableBicepsCurl:

      case DefaultExercise.cableLateralRaise:

      case DefaultExercise.cableFly:

      case DefaultExercise.facePull:

      case DefaultExercise.cableCrunch:

      case DefaultExercise.cablePullThrough:

      case DefaultExercise.oneArmCableBicepsCurl:

      case DefaultExercise.closeGripLatPulldown:

      case DefaultExercise.cableOverheadTricepsExtension:

      case DefaultExercise.cableReverseFly:

      case DefaultExercise.reverseGripLatPulldown:

      case DefaultExercise.straightArmPulldown:

      case DefaultExercise.cableWoodchopper:

      case DefaultExercise.reverseGripTricepsPushdown:

      case DefaultExercise.cableKickback:

      case DefaultExercise.oneArmLatPulldown:

      case DefaultExercise.cableUprightRow:

      case DefaultExercise.oneArmSeatedCableRow:

      case DefaultExercise.cableHammerCurl:

      case DefaultExercise.cableLegExtension:

      case DefaultExercise.cableShrug:

      case DefaultExercise.oneArmPulldown:

      case DefaultExercise.overheadCableCurl:

      case DefaultExercise.standingCableCrunch:

      case DefaultExercise.highPulleyCrunch:

      case DefaultExercise.inclineCableCurl:

      case DefaultExercise.lyingCableCurl:

      case DefaultExercise.pullUps:

      case DefaultExercise.pushUps:

      case DefaultExercise.dips:

      case DefaultExercise.chinUps:

      case DefaultExercise.sitUps:

      case DefaultExercise.bodyweightSquat:

      case DefaultExercise.muscleUps:

      case DefaultExercise.crunches:

      case DefaultExercise.singleLegSquat:

      case DefaultExercise.oneArmPushUps:

      case DefaultExercise.diamondPushUps:

      case DefaultExercise.handstandPushUps:

      case DefaultExercise.burpees:

      case DefaultExercise.neutralGripPullUps:

      case DefaultExercise.lunge:

      case DefaultExercise.oneArmPullUps:

      case DefaultExercise.pistolSquat:

      case DefaultExercise.backExtension:

      case DefaultExercise.hangingLegRaise:

      case DefaultExercise.gluteBridge:

      case DefaultExercise.invertedRow:

      case DefaultExercise.bodyweightCalfRaise:

      case DefaultExercise.russianTwist:

      case DefaultExercise.lyingLegRaise:

      case DefaultExercise.benchDips:

      case DefaultExercise.ringDips:

      case DefaultExercise.declinePushUp:

      case DefaultExercise.toesToBar:

      case DefaultExercise.absWheelRollout:

      case DefaultExercise.reverseLunge:

      case DefaultExercise.hangingKneeRaise:

      case DefaultExercise.declineSitUp:

      case DefaultExercise.nordicHamstringCurl:

      case DefaultExercise.squatJump:

      case DefaultExercise.declineCrunch:

      case DefaultExercise.closeGripPushUp:

      case DefaultExercise.gluteHamRaise:

      case DefaultExercise.inclinePushUp:

      case DefaultExercise.pikePushUp:

      case DefaultExercise.bicycleCrunch:

      case DefaultExercise.ringMuscleUps:

      case DefaultExercise.sideLunge:

      case DefaultExercise.reverseCrunches:

      case DefaultExercise.sissySquat:

      case DefaultExercise.flutterKicks:

      case DefaultExercise.donkeyCalfRaise:

      case DefaultExercise.mountainClimbers:

      case DefaultExercise.archerPushUps:

      case DefaultExercise.clapPullUp:

      case DefaultExercise.sideLegRaise:

      case DefaultExercise.gluteKickback:

      case DefaultExercise.sideCrunch:

      case DefaultExercise.floorHipAbduction:

      case DefaultExercise.superman:

      case DefaultExercise.reverseHyperextension:

      case DefaultExercise.hipExtension:

      case DefaultExercise.romanChairSideBend:

      case DefaultExercise.squatThrust:

      case DefaultExercise.scissorKicks:

      case DefaultExercise.floorHipExtension:
        // TODO(Exercise): Create instructions for exercises
        return [];
    }
  }

  List<String> get _benchPress;

  List<String> get _deadlift;

  List<String> get _squat;
}
