import 'package:drift/drift.dart';
import 'profiles.dart';

class PeriodEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer().references(Profiles, #id, onDelete: KeyAction.cascade)();
  
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  
  TextColumn get flowIntensity => text().nullable()(); // 'Light', 'Medium', 'Heavy'
  TextColumn get symptoms => text().nullable()(); // JSON string or comma-separated list of symptoms
  TextColumn get notes => text().nullable()();
  TextColumn get mood => text().nullable()();

  // Added column for painful period tracking
  BoolColumn get isPainful => boolean().withDefault(const Constant(false))();
  
  // Prediction data? Maybe simpler to compute on fly, but storing cycle length helps
  BoolColumn get isPrediction => boolean().withDefault(const Constant(false))();
}
