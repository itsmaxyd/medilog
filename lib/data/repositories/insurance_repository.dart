import 'package:drift/drift.dart';
import '../database/database.dart';

class InsuranceRepository {
  final AppDatabase _db;

  InsuranceRepository(this._db);

  Future<List<Insurance>> getInsurancesForProfile(int profileId) {
    return (_db.select(_db.insurances)
          ..where((t) => t.profileId.equals(profileId))
          ..orderBy([(t) => OrderingTerm(expression: t.policyNumber)]))
        .get();
  }

  Future<int> addInsurance(InsurancesCompanion insurance) {
    return _db.into(_db.insurances).insert(insurance);
  }

  Future<int> deleteInsurance(int id) {
    return (_db.delete(_db.insurances)..where((t) => t.id.equals(id))).go();
  }
}
