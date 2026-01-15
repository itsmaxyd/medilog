import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:medilog/data/database/database.dart';
import 'package:medilog/data/repositories/period_repository.dart';
import 'package:medilog/providers/providers.dart';
import '../../profiles/controllers/profile_controller.dart';

class PeriodListController extends AsyncNotifier<List<PeriodEntry>> {
  @override
  FutureOr<List<PeriodEntry>> build() {
    final selectedProfileId = ref.watch(selectedProfileIdProvider);
    if (selectedProfileId == null) {
      return [];
    }
    return ref.watch(periodRepositoryProvider).getEntriesForProfile(selectedProfileId);
  }

  Future<void> addEntry({
    required DateTime startDate,
    DateTime? endDate,
    String? flow, // Light, Medium, Heavy
    bool? isPainful,
    String? mood,
    String? notes,
  }) async {
    final selectedProfileId = ref.read(selectedProfileIdProvider);
    if (selectedProfileId == null) return;

    final repo = ref.read(periodRepositoryProvider);
    state = const AsyncValue.loading();
    
    state = await AsyncValue.guard(() async {
      await repo.addEntry(
        PeriodEntriesCompanion(
          profileId: Value(selectedProfileId),
          startDate: Value(startDate),
          endDate: Value(endDate),
          flowIntensity: Value(flow),
          isPainful: Value(isPainful ?? false),
          mood: Value(mood),
          notes: Value(notes),
        ),
      );
      return repo.getEntriesForProfile(selectedProfileId);
    });
  }

  Future<void> deleteEntry(int id) async {
    final selectedProfileId = ref.read(selectedProfileIdProvider);
    if (selectedProfileId == null) return;

    final repo = ref.read(periodRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await repo.deleteEntry(id);
      return repo.getEntriesForProfile(selectedProfileId);
    });
  }
}

final periodListProvider = AsyncNotifierProvider<PeriodListController, List<PeriodEntry>>(() {
  return PeriodListController();
});
