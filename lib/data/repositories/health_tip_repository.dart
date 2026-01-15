import 'package:drift/drift.dart';
import '../database/database.dart';

class HealthTipRepository {
  final AppDatabase _db;

  HealthTipRepository(this._db);

  Future<List<HealthTip>> getAllTips() {
    return _db.select(_db.healthTips).get();
  }

  // Seed initial data if empty
  Future<void> seedTips() async {
    final count = await (_db.select(_db.healthTips).get()).then((l) => l.length);
    if (count == 0) {
      final tips = [
        const HealthTipsCompanion(
          title: Value('Hydration is Key'),
          content: Value('Drink at least 8 glasses of water daily to maintain energy and kidney function.'),
          category: Value('General'),
          source: Value('WHO'),
        ),
        const HealthTipsCompanion(
          title: Value('Walk Daily'),
          content: Value('30 minutes of walking every day can significantly reduce heart disease risk.'),
          category: Value('Fitness'),
          source: Value('Mayo Clinic'),
        ),
        const HealthTipsCompanion(
          title: Value('Salt Intake'),
          content: Value('Reduce sodium intake to lower blood pressure. Avoid processed foods.'),
          category: Value('Diet'),
          source: Value('CDC'),
        ),
        const HealthTipsCompanion(
          title: Value('Sleep Hygiene'),
          content: Value('Aim for 7-8 hours of sleep. Keep a consistent schedule even on weekends.'),
          category: Value('General'),
          source: Value('Sleep Foundation'),
        ),
         const HealthTipsCompanion(
          title: Value('Eye Health'),
          content: Value('Follow the 20-20-20 rule: Every 20 mins, look at something 20 feet away for 20 secs.'),
          category: Value('General'),
          source: Value('AOA'),
        ),
      ];
      
      await _db.batch((batch) {
        batch.insertAll(_db.healthTips, tips);
      });
    }
  }
}
