import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_storage_measurement_api/local_storage_measurement_api.dart';

import 'package:rxdart/rxdart.dart';

/// {@template local_storage_measurement_api}
/// Implementation of the [MeasurementApi] that uses local storage.
///
/// Must be initialized `init()` before use.
/// {@endtemplate}
class LocalStorageMeasurementApi extends MeasurementApi {
  /// {@macro local_storage_measurement_api}
  LocalStorageMeasurementApi();

  /// The name used for storing the Measurement locally.
  ///
  /// This is only exposed for testing
  /// adn should'n be used for consumers of this library.
  static const kMeasurementBoxName = 'measurement_box_name';

  late Box<Measurement> _measurementBox;

  final _measurementsStreamController =
      BehaviorSubject<List<Measurement>>.seeded(const []);

  /// Initialization function registers adapters and opens measurement [Box]
  Future<void> init() async {
    _registerAdapters();

    _measurementBox = await Hive.openBox<Measurement>(kMeasurementBoxName);
  }

  void _registerAdapters() {
    Hive.registerAdapter(MeasurementAdapter());
  }

  void _checkInit() {
    assert(
      _measurementBox.isOpen,
      'Local Storage for [Measurement] has not been initialized.',
    );
  }

  @override
  Future<void> deleteMeasurement(DateTime date) async {
    _checkInit();
    try {
      await _measurementBox.delete(date.toKey());
    } catch (e) {
      throw MeasurementNotFoundException();
    }
  }

  @override
  Measurement get({required DateTime date}) {
    _checkInit();

    final measurement = _measurementBox.get(date.toKey());
    if (measurement == null) {
      throw MeasurementNotFoundException();
    }
    return measurement;
  }

  @override
  Stream<List<Measurement>> getMeasurements() {
    _checkInit();

    final measuments = _measurementBox.values.toList();
    _measurementsStreamController.add(measuments);

    _measurementBox.watch().listen((event) {
      final measuments = _measurementBox.values.toList();
      _measurementsStreamController.add(measuments);
    });

    return _measurementsStreamController.asBroadcastStream();
  }

  @override
  Future<void> saveMeasurement(Measurement measurement) async {
    _checkInit();
    await _measurementBox.put(measurement.date.toKey(), measurement);
  }
}
