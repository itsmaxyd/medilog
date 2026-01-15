import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database/database.dart';
import '../data/database/medicine_database.dart';
import '../data/repositories/profile_repository.dart';
import '../data/repositories/condition_repository.dart';
import '../data/repositories/visit_repository.dart';
import '../data/repositories/report_repository.dart';
import '../data/repositories/reminder_repository.dart';
import '../data/repositories/insurance_repository.dart';
import '../data/repositories/vital_repository.dart';
import '../data/repositories/period_repository.dart';
import '../data/repositories/health_tip_repository.dart';
import '../services/ocr_service.dart';
import '../services/notification_service.dart';

// Database Providers
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final medicineDatabaseProvider = Provider<MedicineDatabase>((ref) {
  final db = MedicineDatabase();
  ref.onDispose(db.close);
  return db;
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ProfileRepository(db);
});

final conditionRepositoryProvider = Provider<ConditionRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ConditionRepository(db);
});

final visitRepositoryProvider = Provider<VisitRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return VisitRepository(db);
});

final ocrServiceProvider = Provider<OCRService>((ref) {
  final service = OCRService();
  ref.onDispose(service.dispose);
  return service;
});

final notificationServiceProvider = Provider<NotificationService>((ref) {
  final service = NotificationService();
  // We can't await init here easily, usually called in main
  return service;
});

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ReportRepository(db);
});

final reminderRepositoryProvider = Provider<ReminderRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ReminderRepository(db);
});

final insuranceRepositoryProvider = Provider<InsuranceRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return InsuranceRepository(db);
});

final vitalRepositoryProvider = Provider<VitalRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return VitalRepository(db);
});

final periodRepositoryProvider = Provider<PeriodRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return PeriodRepository(db);
});

final healthTipRepositoryProvider = Provider<HealthTipRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return HealthTipRepository(db);
});
