import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medilog/data/database/medicine_database.dart';
import 'package:medilog/providers/providers.dart';

// Simple Family provider for search
// We don't need a full AsyncNotifier for just a search function usually, 
// but we might want to keep the "Search State" if we want to show results.

class MedicineSearchController extends AutoDisposeAsyncNotifier<List<Medicine>> {
  @override
  FutureOr<List<Medicine>> build() {
    return [];
  }

  Future<void> search(String query) async {
    if (query.length < 2) {
      state = const AsyncValue.data([]);
      return;
    }
    
    state = const AsyncValue.loading();
    try {
      final db = ref.read(medicineDatabaseProvider);
      final results = await db.searchMedicines(query);
      state = AsyncValue.data(results);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final medicineSearchProvider = AsyncNotifierProvider.autoDispose<MedicineSearchController, List<Medicine>>(() {
  return MedicineSearchController();
});
