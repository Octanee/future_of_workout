import 'package:user_api/user_api.dart';

/// {@template user_repository}
/// A repository that handles user related requests.
/// {@endtemplate}
class UserRepository {
  /// {@macro user_api}
  const UserRepository({required UserApi userApi}) : _userApi = userApi;

  final UserApi _userApi;

  /// Get the user.
  ///
  /// If user are not found,
  /// a [UserNotFoundException] error is thrown.
  User get() => _userApi.get();

  /// Save a [User]
  Future<void> saveUser(User user) => _userApi.saveUser(user);
}
