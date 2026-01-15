import 'package:drift/drift.dart';

class Profiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get age => integer()();
  TextColumn get sex => text()(); // 'Male', 'Female', 'Other'
  TextColumn get emoji => text()(); // Profile avatar
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
