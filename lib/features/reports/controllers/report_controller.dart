import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:medilog/data/database/database.dart';
import 'package:medilog/providers/providers.dart';
import '../../profiles/controllers/profile_controller.dart';

class ReportListController extends AsyncNotifier<List<TestReport>> {
  @override
  FutureOr<List<TestReport>> build() {
    final selectedProfileId = ref.watch(selectedProfileIdProvider);
    if (selectedProfileId == null) {
      return [];
    }
    return ref.watch(reportRepositoryProvider).getReportsForProfile(selectedProfileId);
  }

  Future<void> addReport({
    required String testName,
    required DateTime date,
    String? result,
    String? notes,
    String? filePath,
    String? extractedText,
  }) async {
    final selectedProfileId = ref.read(selectedProfileIdProvider);
    if (selectedProfileId == null) return;

    final repo = ref.read(reportRepositoryProvider);
    state = const AsyncValue.loading();
    
    state = await AsyncValue.guard(() async {
      await repo.addReport(
        TestReportsCompanion(
          profileId: Value(selectedProfileId),
          testName: Value(testName),
          date: Value(date),
          result: Value(result),
          notes: Value(notes),
          filePath: Value(filePath),
          extractedText: Value(extractedText),
        ),
      );
      return repo.getReportsForProfile(selectedProfileId);
    });
  }

  Future<void> deleteReport(int id) async {
    final selectedProfileId = ref.read(selectedProfileIdProvider);
    if (selectedProfileId == null) return;

    final repo = ref.read(reportRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await repo.deleteReport(id);
      return repo.getReportsForProfile(selectedProfileId);
    });
  }
}

final reportListProvider = AsyncNotifierProvider<ReportListController, List<TestReport>>(() {
  return ReportListController();
});
