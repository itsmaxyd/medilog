import 'package:drift/drift.dart';
import 'profiles.dart';

class Insurances extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer().references(Profiles, #id, onDelete: KeyAction.cascade)();
  
  TextColumn get providerName => text()();
  TextColumn get policyNumber => text()();
  
  RealColumn get premiumAmount => real().nullable()();
  DateTimeColumn get premiumDueDate => dateTime().nullable()();
  
  // Added column for policy expiry
  DateTimeColumn get validUntil => dateTime().nullable()();
  
  TextColumn get coverageDetails => text().nullable()();
  TextColumn get contactNumber => text().nullable()();
  TextColumn get notes => text().nullable()(); // Added notes column
  
  // Store path to policy document image/PDF
  TextColumn get policyDocumentPath => text().nullable()();
}
