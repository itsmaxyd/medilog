import 'package:drift/drift.dart';

class HealthTips extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get category => text()(); // 'Nutrition', 'Exercise', 'MentalHealth'
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get source => text()(); // 'WHO', 'CDC', 'Mayo Clinic'
}
