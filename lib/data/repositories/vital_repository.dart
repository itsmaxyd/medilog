import 'package:drift/drift.dart';
import '../database/database.dart';

class VitalRepository {
  final AppDatabase _db;

  VitalRepository(this._db);

  Future<List<VitalReading>> getReadingsForProfile(int profileId) {
    return (_db.select(_db.vitalReadings)
          ..where((t) => t.profileId.equals(profileId))
          ..orderBy([(t) => OrderingTerm(expression: t.recordedAt, mode: OrderingMode.desc)]))
        .get();
  }

  Future<int> addReading(VitalReadingsCompanion reading) {
    return _db.into(_db.vitalReadings).insert(reading);
  }

  Future<int> deleteReading(int id) {
    return (_db.delete(_db.vitalReadings)..where((t) => t.id.equals(id))).go();
  }
}
