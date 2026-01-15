import 'package:drift/drift.dart';
import '../database/database.dart';

class ConditionRepository {
  final AppDatabase _db;

  ConditionRepository(this._db);

  // Get conditions for a specific profile
  Future<List<HealthCondition>> getConditionsForProfile(int profileId) {
    return (_db.select(_db.healthConditions)
          ..where((t) => t.profileId.equals(profileId))
          ..orderBy([(t) => OrderingTerm(expression: t.diagnosedAt, mode: OrderingMode.desc)]))
        .get();
  }

  // Create new condition
  Future<int> addCondition(HealthConditionsCompanion condition) {
    return _db.into(_db.healthConditions).insert(condition);
  }

  // Update condition
  Future<bool> updateCondition(HealthCondition condition) {
    return _db.update(_db.healthConditions).replace(condition);
  }

  // Delete condition
  Future<int> deleteCondition(int id) {
    return (_db.delete(_db.healthConditions)..where((t) => t.id.equals(id))).go();
  }
}
