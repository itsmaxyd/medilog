import 'dart:convert';
import 'dart:io';
import 'package:sqlite3/sqlite3.dart';

void main() {
  print('Starting medicine database generation...');
  
  // Input JSON file
  final jsonFile = File('/home/max/scripts/medilog/extra/Indian-Medicine-Dataset-main/DATA/indian_medicine_data.json');
  if (!jsonFile.existsSync()) {
    print('Error: JSON file not found at ${jsonFile.path}');
    exit(1);
  }

  // Output DB file
  final dbFile = File('assets/medicines.db');
  if (dbFile.existsSync()) {
    dbFile.deleteSync();
  }
  
  // Ensure assets directory exists
  Directory('assets').createSync(recursive: true);

  print('Opening database...');
  final db = sqlite3.open(dbFile.path);

  // Create table
  // Matches the Drift definition:
  // IntColumn get id => integer().autoIncrement()();
  // TextColumn get name => text()();
  // RealColumn get price => real().nullable()();
  // TextColumn get manufacturer => text().nullable()();
  // TextColumn get type => text().nullable()();
  // TextColumn get packSizeLabel => text().nullable()();
  // TextColumn get shortComposition1 => text().nullable()();
  // TextColumn get shortComposition2 => text().nullable()();
  // BoolColumn get isDiscontinued => boolean().withDefault(const Constant(false))();
  
  db.execute('''
    CREATE TABLE medicines (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      price REAL,
      manufacturer TEXT,
      type TEXT,
      pack_size_label TEXT,
      short_composition1 TEXT,
      short_composition2 TEXT,
      is_discontinued INTEGER DEFAULT 0,
      search_key TEXT
    );
  ''');

  // Create index for search
  db.execute('CREATE INDEX idx_medicines_name ON medicines(name);');
  db.execute('CREATE INDEX idx_medicines_search ON medicines(search_key);');

  print('Reading JSON...');
  final jsonString = jsonFile.readAsStringSync();
  final List<dynamic> medicines = jsonDecode(jsonString);
  
  print('Processing ${medicines.length} medicines...');

  final stmt = db.prepare('''
    INSERT INTO medicines (
      name, price, manufacturer, type, pack_size_label, 
      short_composition1, short_composition2, is_discontinued, search_key
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
  ''');

  int count = 0;
  final batchSize = 1000;

  db.execute('BEGIN TRANSACTION');

  try {
    for (final m in medicines) {
      final name = m['name']?.toString() ?? 'Unknown';
      // Clean price: "223.42" -> 223.42
      double? price;
      try {
        price = double.tryParse(m['price(₹)']?.toString() ?? '');
      } catch (_) {}

      final manufacturer = m['manufacturer_name']?.toString();
      final type = m['type']?.toString();
      final packSize = m['pack_size_label']?.toString();
      final comp1 = m['short_composition1']?.toString();
      final comp2 = m['short_composition2']?.toString();
      
      // "FALSE" -> 0, "TRUE" -> 1
      final isDiscontinuedRaw = m['Is_discontinued']?.toString().toUpperCase();
      final isDiscontinued = isDiscontinuedRaw == 'TRUE' ? 1 : 0;
      
      final searchKey = name.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

      stmt.execute([
        name,
        price,
        manufacturer,
        type,
        packSize,
        comp1,
        comp2,
        isDiscontinued,
        searchKey
      ]);

      count++;
      if (count % batchSize == 0) {
        print('Inserted $count...');
      }
    }
    
    db.execute('COMMIT');
    print('Finished! Total inserted: $count');
    
  } catch (e) {
    print('Error: $e');
    db.execute('ROLLBACK');
  } finally {
    stmt.dispose();
    db.dispose();
  }
}
