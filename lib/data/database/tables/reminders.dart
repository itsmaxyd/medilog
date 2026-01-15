import 'package:drift/drift.dart';
import 'profiles.dart';

class Reminders extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer().references(Profiles, #id, onDelete: KeyAction.cascade)();
  
  TextColumn get type => text()(); // 'Medicine', 'FollowUp', 'Insurance', 'Vitals', 'Period'
  
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  
  DateTimeColumn get scheduledAt => dateTime()();
  
  // Recurrence rule (e.g., 'DAILY', 'WEEKLY', complex cron-like or simple string)
  TextColumn get repeatPattern => text().nullable()(); 
  
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  
  // Link to other entities ID if needed (e.g., prescription ID)
  IntColumn get entityId => integer().nullable()(); 
}
