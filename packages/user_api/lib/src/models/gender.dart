/// {@tempalte gender}
/// Type of user gender.
/// {@endtemplate}
enum Gender {
  /// Male
  male(name: 'Male'),

  /// Female
  female(name: 'Female'),

  /// Other
  other(name: 'Other');

  /// {@macro gender}
  const Gender({
    required this.name,
  });

  /// Displayed name of gender.
  final String name;
}
