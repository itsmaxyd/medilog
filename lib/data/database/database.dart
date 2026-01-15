import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/profiles.dart';
import 'tables/health_conditions.dart';
import 'tables/doctor_visits.dart';
import 'tables/prescriptions.dart';
import 'tables/test_reports.dart';
import 'tables/vital_readings.dart';
import 'tables/period_entries.dart';
import 'tables/insurances.dart';
import 'tables/reminders.dart';
import 'tables/health_tips.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Profiles,
  HealthConditions,
  DoctorVisits,
  Prescriptions,
  TestReports,
  VitalReadings,
  PeriodEntries,
  Insurances,
  Reminders,
  HealthTips,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // We can implement migration logic here in the future
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'medilog.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
