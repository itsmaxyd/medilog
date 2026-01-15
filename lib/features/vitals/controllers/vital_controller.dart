import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:medilog/data/database/database.dart';
import 'package:medilog/data/repositories/vital_repository.dart';
import 'package:medilog/providers/providers.dart';
import '../../profiles/controllers/profile_controller.dart';

class VitalListController extends AsyncNotifier<List<VitalReading>> {
  @override
  FutureOr<List<VitalReading>> build() {
    final selectedProfileId = ref.watch(selectedProfileIdProvider);
    if (selectedProfileId == null) {
      return [];
    }
    return ref.watch(vitalRepositoryProvider).getReadingsForProfile(selectedProfileId);
  }

  Future<void> addReading({
    required String type,
    required double value1,
    double? value2,
    String? unit,
    String? notes,
    required DateTime recordedAt,
  }) async {
    final selectedProfileId = ref.read(selectedProfileIdProvider);
    if (selectedProfileId == null) return;

    final repo = ref.read(vitalRepositoryProvider);
    state = const AsyncValue.loading();
    
    state = await AsyncValue.guard(() async {
      await repo.addReading(
        VitalReadingsCompanion(
          profileId: Value(selectedProfileId),
          type: Value(type),
          value1: Value(value1),
          value2: Value(value2),
          unit: Value(unit ?? ''), // Allow empty unit
          notes: Value(notes),
          recordedAt: Value(recordedAt),
        ),
      );
      return repo.getReadingsForProfile(selectedProfileId);
    });
  }

  Future<void> deleteReading(int id) async {
    final selectedProfileId = ref.read(selectedProfileIdProvider);
    if (selectedProfileId == null) return;

    final repo = ref.read(vitalRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await repo.deleteReading(id);
      return repo.getReadingsForProfile(selectedProfileId);
    });
  }
}

final vitalListProvider = AsyncNotifierProvider<VitalListController, List<VitalReading>>(() {
  return VitalListController();
});
