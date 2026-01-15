import 'package:drift/drift.dart';
import 'doctor_visits.dart';

class Prescriptions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get visitId => integer().references(DoctorVisits, #id, onDelete: KeyAction.cascade)();
  
  // Link to medicine database (optional, can be custom text)
  IntColumn get medicineId => integer().nullable()(); 
  TextColumn get medicineName => text()();
  
  TextColumn get dosage => text()(); // e.g., "500mg"
  TextColumn get frequency => text()(); // e.g., "1-0-1" or "Morning, Night"
  IntColumn get durationDays => integer().nullable()();
  TextColumn get notes => text().nullable()();
  
  DateTimeColumn get startDate => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}
