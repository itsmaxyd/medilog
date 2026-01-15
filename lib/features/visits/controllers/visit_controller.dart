import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:medilog/data/database/database.dart';
import 'package:medilog/providers/providers.dart';
import '../../profiles/controllers/profile_controller.dart';

class VisitListController extends AsyncNotifier<List<DoctorVisit>> {
  @override
  FutureOr<List<DoctorVisit>> build() {
    final selectedProfileId = ref.watch(selectedProfileIdProvider);
    if (selectedProfileId == null) {
      return [];
    }
    return ref.watch(visitRepositoryProvider).getVisitsForProfile(selectedProfileId);
  }

  Future<int?> addVisit({
    required String doctorName,
    String? hospital,
    String? doctorContact,
    required DateTime visitDate,
    String? notes,
    DateTime? followUpDate,
  }) async {
    final selectedProfileId = ref.read(selectedProfileIdProvider);
    if (selectedProfileId == null) return null;

    final repo = ref.read(visitRepositoryProvider);
    state = const AsyncValue.loading();
    
    // We return the ID of the created visit
    int? createdId;
    
    state = await AsyncValue.guard(() async {
      createdId = await repo.createVisit(
        DoctorVisitsCompanion(
          profileId: Value(selectedProfileId),
          doctorName: Value(doctorName),
          hospital: Value(hospital),
          doctorContact: Value(doctorContact),
          visitDate: Value(visitDate),
          notes: Value(notes),
          followUpDate: Value(followUpDate),
        ),
      );
      return repo.getVisitsForProfile(selectedProfileId);
    });
    
    return createdId;
  }

  Future<void> deleteVisit(int id) async {
    final selectedProfileId = ref.read(selectedProfileIdProvider);
    if (selectedProfileId == null) return;

    final repo = ref.read(visitRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await repo.deleteVisit(id);
      return repo.getVisitsForProfile(selectedProfileId);
    });
  }
}

final visitListProvider = AsyncNotifierProvider<VisitListController, List<DoctorVisit>>(() {
  return VisitListController();
});
