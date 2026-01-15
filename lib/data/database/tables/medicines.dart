import 'package:drift/drift.dart';

// This table mirrors the structure of the Indian Medicine Dataset
// We will pre-populate this or import from the JSON/CSV
class Medicines extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get price => real().nullable()();
  TextColumn get manufacturer => text().nullable()();
  TextColumn get type => text().nullable()(); // 'allopathy', etc.
  TextColumn get packSizeLabel => text().nullable()();
  TextColumn get shortComposition1 => text().nullable()();
  TextColumn get shortComposition2 => text().nullable()();
  BoolColumn get isDiscontinued => boolean().withDefault(const Constant(false))();
  
  // For searching
  TextColumn get searchKey => text().nullable()(); // Normalized name for searching
}
