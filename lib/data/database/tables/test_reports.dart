import 'package:drift/drift.dart';
import 'profiles.dart';
import 'doctor_visits.dart';

class TestReports extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer().references(Profiles, #id, onDelete: KeyAction.cascade)();
  IntColumn get visitId => integer().nullable().references(DoctorVisits, #id, onDelete: KeyAction.cascade)();
  
  TextColumn get testName => text()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  
  TextColumn get result => text().nullable()();
  TextColumn get notes => text().nullable()();
  
  // Path to stored file/image locally or base64 (for small files)
  // Since we are offline-first, we'll store paths to files in app's document directory
  TextColumn get filePath => text().nullable()(); 
  
  // Extracted text from OCR
  TextColumn get extractedText => text().nullable()();
}
