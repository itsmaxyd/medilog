import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/medicines.dart';

part 'medicine_database.g.dart';

@DriftDatabase(tables: [Medicines])
class MedicineDatabase extends _$MedicineDatabase {
  MedicineDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  
  // Searching
  Future<List<Medicine>> searchMedicines(String query, {int limit = 20}) {
    // Simple verification - normalized search
    final cleanQuery = query.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return (select(medicines)
      ..where((t) => t.searchKey.like('$cleanQuery%'))
      ..limit(limit))
      .get();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'medicines.db'));
    
    // Copy from assets if not exists
    if (!await file.exists()) {
      // Note: This requires the asset to be declared in pubspec.yaml
      // We will assume it will be handled by a Repository or this init block
      // But NativeDatabase doesn't easily allow async asset load inside synchronous constructor access?
      // Actually LazyDatabase IS async.
      try {
        final blob = await rootBundle.load('assets/medicines.db');
        final buffer = blob.buffer;
        await file.writeAsBytes(
            buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
      } catch (e) {
        print('Error copying medicine database: $e');
        // Fallback or error handling
      }
    }
    
    return NativeDatabase.createInBackground(file);
  });
}
