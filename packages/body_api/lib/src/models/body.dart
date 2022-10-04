import 'package:equatable/equatable.dart';

/// {@template body}
///
/// {@endtemplate}
class Body extends Equatable {
  ///{@macro body}
  const Body({
    this.neckInvolvement = 0,
    this.chestInvolvement = 0,
    this.serratusInvolvement = 0,
    this.shouldersInvolvement = 0,
    this.bicepsInvolvement = 0,
    this.tricepsInvolvement = 0,
    this.forearmInvolvement = 0,
    this.absInvolvement = 0,
    this.obliquesInvolvement = 0,
    this.trapeziusInvolvement = 0,
    this.lattisimusInvolvement = 0,
    this.teresMajorInvolvement = 0,
    this.erectorSpinaeInvolvement = 0,
    this.adductorsInvolvement = 0,
    this.abductorsInvolvement = 0,
    this.glutesInvolvement = 0,
    this.hamsteringInvolvement = 0,
    this.quadricepsInvolvement = 0,
    this.calfInvolvement = 0,
  });

  /// Involvement of neck
  ///
  /// A value between 0 and 100
  final int neckInvolvement;

  /// Involvement of chest
  ///
  /// A value between 0 and 100
  final int chestInvolvement;

  /// Involvement of serratus
  ///
  /// A value between 0 and 100
  final int serratusInvolvement;

  /// Involvement of shoulders
  ///
  /// A value between 0 and 100
  final int shouldersInvolvement;

  /// Involvement of biceps
  ///
  /// A value between 0 and 100
  final int bicepsInvolvement;

  /// Involvement of triceps
  ///
  /// A value between 0 and 100
  final int tricepsInvolvement;

  /// Involvement of forearm
  ///
  /// A value between 0 and 100
  final int forearmInvolvement;

  /// Involvement of abs
  ///
  /// A value between 0 and 100
  final int absInvolvement;

  /// Involvement of obliques
  ///
  /// A value between 0 and 100
  final int obliquesInvolvement;

  /// Involvement of trapezius
  ///
  /// A value between 0 and 100
  final int trapeziusInvolvement;

  /// Involvement of lattisimus
  ///
  /// A value between 0 and 100
  final int lattisimusInvolvement;

  /// Involvement of teresMajor
  ///
  /// A value between 0 and 100
  final int teresMajorInvolvement;

  /// Involvement of erectorSpinae
  ///
  /// A value between 0 and 100
  final int erectorSpinaeInvolvement;

  /// Involvement of adductors
  ///
  /// A value between 0 and 100
  final int adductorsInvolvement;

  /// Involvement of abductors
  ///
  /// A value between 0 and 100
  final int abductorsInvolvement;

  /// Involvement of glutes
  ///
  /// A value between 0 and 100
  final int glutesInvolvement;

  /// Involvement of hamstering
  ///
  /// A value between 0 and 100
  final int hamsteringInvolvement;

  /// Involvement of quadriceps
  ///
  /// A value between 0 and 100
  final int quadricepsInvolvement;

  /// Involvement of calf
  ///
  /// A value between 0 and 100
  final int calfInvolvement;

  /// Copy instance with given values.
  ///
  /// {@macro body}
  Body copyWith({
    int Function()? neckInvolvement,
    int Function()? chestInvolvement,
    int Function()? serratusInvolvement,
    int Function()? shouldersInvolvement,
    int Function()? bicepsInvolvement,
    int Function()? tricepsInvolvement,
    int Function()? forearmInvolvement,
    int Function()? absInvolvement,
    int Function()? obliquesInvolvement,
    int Function()? trapeziusInvolvement,
    int Function()? lattisimusInvolvement,
    int Function()? teresMajorInvolvement,
    int Function()? erectorSpinaeInvolvement,
    int Function()? adductorsInvolvement,
    int Function()? abductorsInvolvement,
    int Function()? glutesInvolvement,
    int Function()? hamsteringInvolvement,
    int Function()? quadricepsInvolvement,
    int Function()? calfInvolvement,
  }) =>
      Body(
        neckInvolvement:
            neckInvolvement != null ? neckInvolvement() : this.neckInvolvement,
        chestInvolvement: chestInvolvement != null
            ? chestInvolvement()
            : this.chestInvolvement,
        serratusInvolvement: serratusInvolvement != null
            ? serratusInvolvement()
            : this.serratusInvolvement,
        shouldersInvolvement: shouldersInvolvement != null
            ? shouldersInvolvement()
            : this.shouldersInvolvement,
        bicepsInvolvement: bicepsInvolvement != null
            ? bicepsInvolvement()
            : this.bicepsInvolvement,
        tricepsInvolvement: tricepsInvolvement != null
            ? tricepsInvolvement()
            : this.tricepsInvolvement,
        forearmInvolvement: forearmInvolvement != null
            ? forearmInvolvement()
            : this.forearmInvolvement,
        absInvolvement:
            absInvolvement != null ? absInvolvement() : this.absInvolvement,
        obliquesInvolvement: obliquesInvolvement != null
            ? obliquesInvolvement()
            : this.obliquesInvolvement,
        trapeziusInvolvement: trapeziusInvolvement != null
            ? trapeziusInvolvement()
            : this.trapeziusInvolvement,
        lattisimusInvolvement: lattisimusInvolvement != null
            ? lattisimusInvolvement()
            : this.lattisimusInvolvement,
        teresMajorInvolvement: teresMajorInvolvement != null
            ? teresMajorInvolvement()
            : this.teresMajorInvolvement,
        erectorSpinaeInvolvement: erectorSpinaeInvolvement != null
            ? erectorSpinaeInvolvement()
            : this.erectorSpinaeInvolvement,
        adductorsInvolvement: adductorsInvolvement != null
            ? adductorsInvolvement()
            : this.adductorsInvolvement,
        abductorsInvolvement: abductorsInvolvement != null
            ? abductorsInvolvement()
            : this.abductorsInvolvement,
        glutesInvolvement: glutesInvolvement != null
            ? glutesInvolvement()
            : this.glutesInvolvement,
        hamsteringInvolvement: hamsteringInvolvement != null
            ? hamsteringInvolvement()
            : this.hamsteringInvolvement,
        quadricepsInvolvement: quadricepsInvolvement != null
            ? quadricepsInvolvement()
            : this.quadricepsInvolvement,
        calfInvolvement:
            calfInvolvement != null ? calfInvolvement() : this.calfInvolvement,
      );

  @override
  List<Object?> get props => [
        neckInvolvement,
        chestInvolvement,
        serratusInvolvement,
        shouldersInvolvement,
        bicepsInvolvement,
        tricepsInvolvement,
        forearmInvolvement,
        absInvolvement,
        obliquesInvolvement,
        trapeziusInvolvement,
        lattisimusInvolvement,
        teresMajorInvolvement,
        erectorSpinaeInvolvement,
        adductorsInvolvement,
        abductorsInvolvement,
        glutesInvolvement,
        hamsteringInvolvement,
        quadricepsInvolvement,
        calfInvolvement,
      ];
}
