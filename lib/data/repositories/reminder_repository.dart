import 'package:drift/drift.dart';
import '../database/database.dart';

class ReminderRepository {
  final AppDatabase _db;

  ReminderRepository(this._db);

  // Get reminders for a profile
  Future<List<Reminder>> getRemindersForProfile(int profileId) {
    return (_db.select(_db.reminders)
          ..where((t) => t.profileId.equals(profileId))
          ..orderBy([(t) => OrderingTerm(expression: t.scheduledAt)]))
        .get();
  }
  
  // Get active reminders
  Future<List<Reminder>> getActiveReminders(int profileId) {
    return (_db.select(_db.reminders)
          ..where((t) => t.profileId.equals(profileId) & t.isActive.equals(true))
          ..orderBy([(t) => OrderingTerm(expression: t.scheduledAt)]))
        .get();
  }

  // Add reminder
  Future<int> addReminder(RemindersCompanion reminder) {
    return _db.into(_db.reminders).insert(reminder);
  }
  
  // Update reminder
  Future<bool> updateReminder(Reminder reminder) {
    return _db.update(_db.reminders).replace(reminder);
  }

  // Delete reminder
  Future<int> deleteReminder(int id) {
    return (_db.delete(_db.reminders)..where((t) => t.id.equals(id))).go();
  }
}
