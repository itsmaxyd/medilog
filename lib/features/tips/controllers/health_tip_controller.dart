import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medilog/data/database/database.dart';
import 'package:medilog/data/repositories/health_tip_repository.dart';
import 'package:medilog/providers/providers.dart';

final healthTipsProvider = FutureProvider<List<HealthTip>>((ref) async {
  final repo = ref.watch(healthTipRepositoryProvider);
  // Ensure seed
  await repo.seedTips();
  return repo.getAllTips();
});
