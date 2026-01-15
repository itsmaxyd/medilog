import 'package:drift/drift.dart';
import '../database/database.dart';

class PeriodRepository {
  final AppDatabase _db;

  PeriodRepository(this._db);

  Future<List<PeriodEntry>> getEntriesForProfile(int profileId) {
    return (_db.select(_db.periodEntries)
          ..where((t) => t.profileId.equals(profileId))
          ..orderBy([(t) => OrderingTerm(expression: t.startDate, mode: OrderingMode.desc)]))
        .get();
  }

  Future<int> addEntry(PeriodEntriesCompanion entry) {
    return _db.into(_db.periodEntries).insert(entry);
  }

  Future<int> deleteEntry(int id) {
    return (_db.delete(_db.periodEntries)..where((t) => t.id.equals(id))).go();
  }
}
