import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:medilog/data/database/database.dart';
import 'package:medilog/data/repositories/insurance_repository.dart';
import 'package:medilog/providers/providers.dart';
import '../../profiles/controllers/profile_controller.dart';

class InsuranceListController extends AsyncNotifier<List<Insurance>> {
  @override
  FutureOr<List<Insurance>> build() {
    final selectedProfileId = ref.watch(selectedProfileIdProvider);
    if (selectedProfileId == null) {
      return [];
    }
    return ref.watch(insuranceRepositoryProvider).getInsurancesForProfile(selectedProfileId);
  }

  Future<void> addInsurance({
    required String providerName,
    required String policyNumber,
    required DateTime validUntil,
    String? contactNumber,
    String? notes,
  }) async {
    final selectedProfileId = ref.read(selectedProfileIdProvider);
    if (selectedProfileId == null) return;

    final repo = ref.read(insuranceRepositoryProvider);
    state = const AsyncValue.loading();
    
    state = await AsyncValue.guard(() async {
      await repo.addInsurance(
        InsurancesCompanion(
          profileId: Value(selectedProfileId),
          providerName: Value(providerName),
          policyNumber: Value(policyNumber),
          validUntil: Value(validUntil),
          contactNumber: Value(contactNumber),
          notes: Value(notes),
        ),
      );
      return repo.getInsurancesForProfile(selectedProfileId);
    });
  }

  Future<void> deleteInsurance(int id) async {
    final selectedProfileId = ref.read(selectedProfileIdProvider);
    if (selectedProfileId == null) return;

    final repo = ref.read(insuranceRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await repo.deleteInsurance(id);
      return repo.getInsurancesForProfile(selectedProfileId);
    });
  }
}

final insuranceListProvider = AsyncNotifierProvider<InsuranceListController, List<Insurance>>(() {
  return InsuranceListController();
});
