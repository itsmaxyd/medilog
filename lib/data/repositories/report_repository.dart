import 'package:drift/drift.dart';
import '../database/database.dart';

class ReportRepository {
  final AppDatabase _db;

  ReportRepository(this._db);

  // Get reports for a profile
  Future<List<TestReport>> getReportsForProfile(int profileId) {
    return (_db.select(_db.testReports)
          ..where((t) => t.profileId.equals(profileId))
          ..orderBy([(t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)]))
        .get();
  }

  // Add a report
  Future<int> addReport(TestReportsCompanion report) {
    return _db.into(_db.testReports).insert(report);
  }

  // Delete a report
  Future<int> deleteReport(int id) {
    return (_db.delete(_db.testReports)..where((t) => t.id.equals(id))).go();
  }
}
