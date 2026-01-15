import 'package:drift/drift.dart';
import 'profiles.dart';

class VitalReadings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer().references(Profiles, #id, onDelete: KeyAction.cascade)();
  
  TextColumn get type => text()(); // 'Weight', 'BloodPressure', 'HeartRate', 'Temperature', 'Sugar'
  TextColumn get unit => text().nullable()(); // Added unit column
  
  // Value 1 is primary (e.g., Weight in kg, Systolic BP, Sugar level)
  RealColumn get value1 => real()();
  
  // Value 2 is secondary (e.g., Diastolic BP)
  RealColumn get value2 => real().nullable()();
  
  DateTimeColumn get recordedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get notes => text().nullable()();
  
  // Optional: Context tag like 'Before Meal', 'After Meal', 'Resting'
  TextColumn get context => text().nullable()();
}
