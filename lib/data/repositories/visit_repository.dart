import 'package:drift/drift.dart';
import '../database/database.dart';

class VisitRepository {
  final AppDatabase _db;

  VisitRepository(this._db);

  // Get visits for profile
  Future<List<DoctorVisit>> getVisitsForProfile(int profileId) {
    return (_db.select(_db.doctorVisits)
          ..where((t) => t.profileId.equals(profileId))
          ..orderBy([(t) => OrderingTerm(expression: t.visitDate, mode: OrderingMode.desc)]))
        .get();
  }

  // Get single visit
  Future<DoctorVisit?> getVisitById(int id) {
    return (_db.select(_db.doctorVisits)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  // Create visit
  Future<int> createVisit(DoctorVisitsCompanion visit) {
    return _db.into(_db.doctorVisits).insert(visit);
  }

  // Update visit
  Future<bool> updateVisit(DoctorVisit visit) {
    return _db.update(_db.doctorVisits).replace(visit);
  }

  // Delete visit (cascades to prescriptions due to DB schema)
  Future<int> deleteVisit(int id) {
    return (_db.delete(_db.doctorVisits)..where((t) => t.id.equals(id))).go();
  }

  // --- Prescriptions ---

  // Get prescriptions for a visit
  Future<List<Prescription>> getPrescriptionsForVisit(int visitId) {
    return (_db.select(_db.prescriptions)..where((t) => t.visitId.equals(visitId))).get();
  }

  // Add prescription
  Future<int> addPrescription(PrescriptionsCompanion prescription) {
    return _db.into(_db.prescriptions).insert(prescription);
  }
  
  // Delete prescription
  Future<int> deletePrescription(int id) {
    return (_db.delete(_db.prescriptions)..where((t) => t.id.equals(id))).go();
  }
}
