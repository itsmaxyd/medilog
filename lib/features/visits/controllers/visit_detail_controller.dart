import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medilog/data/database/database.dart';
import 'package:medilog/data/repositories/visit_repository.dart';
import 'package:medilog/providers/providers.dart';

final visitPrescriptionsProvider = FutureProvider.family<List<Prescription>, int>((ref, visitId) async {
  final repo = ref.watch(visitRepositoryProvider);
  return repo.getPrescriptionsForVisit(visitId);
});
