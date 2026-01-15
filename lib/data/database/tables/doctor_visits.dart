import 'package:drift/drift.dart';
import 'profiles.dart';

class DoctorVisits extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer().references(Profiles, #id, onDelete: KeyAction.cascade)();
  TextColumn get doctorName => text()();
  TextColumn get doctorContact => text().nullable()();
  TextColumn get hospital => text().nullable()();
  DateTimeColumn get visitDate => dateTime().withDefault(currentDateAndTime)();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get followUpDate => dateTime().nullable()();
}
