import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_storage_user_api/local_storage_user_api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_api/user_api.dart';

/// {@template local_storage_user_api}
/// Implementation of the [UserApi] that uses local storage.
///
/// Must be initialized `init()` before  use.
/// {@endtemplate}
class LocalStorageUserApi extends UserApi {
  /// {@macro local_storage_user_api}
  LocalStorageUserApi();

  late Box<User> _userBox;

  /// The name used for storing user locally.
  ///
  /// This is only exposed for testing
  /// and shouldn't be used for consumers of this library.
  static const kUserBoxName = 'user_box_name';

  final _kUserKey = 'user';

  final _userStreamController = BehaviorSubject<User?>();

  /// Initialization function registers adapters and opens user [Box].
  Future<void> init() async {
    _registerAdapters();

    _userBox = await Hive.openBox<User>(kUserBoxName);
  }

  void _registerAdapters() {
    Hive
      ..registerAdapter(GenderAdapter())
      ..registerAdapter(LengthUnitAdapter())
      ..registerAdapter(UserAdapter())
      ..registerAdapter(WeightUnitAdapter());
  }

  void _checkInit() {
    assert(_userBox.isOpen, 'Local Storage has not been initialized');
  }

  @override
  User get() {
    _checkInit();
    final user = _userBox.get(_kUserKey);
    if (user == null) {
      throw UserNotFoundException();
    }
    return user;
  }

  @override
  Future<void> saveUser(User user) async {
    _checkInit();
    await _userBox.put(_kUserKey, user);
  }

  @override
  Stream<User?> getUser() {
    _checkInit();

    final user = _userBox.get(_kUserKey);
    _userStreamController.add(user);

    _userBox.watch(key: _kUserKey).listen((_) {
      final user = _userBox.get(_kUserKey);
      _userStreamController.add(user);
    });

    return _userStreamController.asBroadcastStream();
  }
}
