import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:medilog/data/database/database.dart';
import 'package:medilog/providers/providers.dart';
import '../../profiles/controllers/profile_controller.dart';

class ConditionListController extends AsyncNotifier<List<HealthCondition>> {
  @override
  FutureOr<List<HealthCondition>> build() {
    final selectedProfileId = ref.watch(selectedProfileIdProvider);
    if (selectedProfileId == null) {
      return [];
    }
    return ref.watch(conditionRepositoryProvider).getConditionsForProfile(selectedProfileId);
  }

  Future<void> addCondition({
    required String name,
    String? type,
    DateTime? diagnosedAt,
    String? notes,
  }) async {
    final selectedProfileId = ref.read(selectedProfileIdProvider);
    if (selectedProfileId == null) return;

    final repo = ref.read(conditionRepositoryProvider);
    state = const AsyncValue.loading();
    
    state = await AsyncValue.guard(() async {
      await repo.addCondition(
        HealthConditionsCompanion(
          profileId: Value(selectedProfileId),
          name: Value(name),
          type: Value(type),
          diagnosedAt: Value(diagnosedAt),
          notes: Value(notes),
        ),
      );
      return repo.getConditionsForProfile(selectedProfileId);
    });
  }

  Future<void> deleteCondition(int id) async {
    final selectedProfileId = ref.read(selectedProfileIdProvider);
    if (selectedProfileId == null) return;

    final repo = ref.read(conditionRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await repo.deleteCondition(id);
      return repo.getConditionsForProfile(selectedProfileId);
    });
  }
}

final conditionListProvider = AsyncNotifierProvider<ConditionListController, List<HealthCondition>>(() {
  return ConditionListController();
});
