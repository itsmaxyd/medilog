import 'package:drift/drift.dart';
import 'profiles.dart';

class HealthConditions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer().references(Profiles, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()(); // 'Diabetes', 'Hypertension', etc.
  TextColumn get type => text().nullable()(); // 'Chronic', 'Acute', etc.
  DateTimeColumn get diagnosedAt => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
}
