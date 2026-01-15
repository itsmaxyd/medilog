import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:medilog/data/database/database.dart';
import 'package:medilog/providers/providers.dart';

// AsyncNotifier for list of profiles
class ProfileListController extends AsyncNotifier<List<Profile>> {
  @override
  FutureOr<List<Profile>> build() {
    return ref.watch(profileRepositoryProvider).getAllProfiles();
  }

  Future<void> addProfile({
    required String name,
    required int age,
    required String sex,
    required String emoji,
  }) async {
    final repo = ref.read(profileRepositoryProvider);
    state = const AsyncValue.loading();
    
    state = await AsyncValue.guard(() async {
      await repo.createProfile(
        ProfilesCompanion(
          name: Value(name),
          age: Value(age),
          sex: Value(sex),
          emoji: Value(emoji),
          createdAt: Value(DateTime.now()),
        ),
      );
      return repo.getAllProfiles();
    });
  }

  Future<void> deleteProfile(int id) async {
    final repo = ref.read(profileRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await repo.deleteProfile(id);
      return repo.getAllProfiles();
    });
  }
}

final profileListProvider = AsyncNotifierProvider<ProfileListController, List<Profile>>(() {
  return ProfileListController();
});

// Selected Profile Provider
final selectedProfileIdProvider = StateProvider<int?>((ref) => null);

final selectedProfileProvider = Provider<Profile?>((ref) {
  final selectedId = ref.watch(selectedProfileIdProvider);
  final profilesAsync = ref.watch(profileListProvider);
  
  return profilesAsync.when(
    data: (profiles) {
      if (selectedId == null) return null;
      try {
        return profiles.firstWhere((p) => p.id == selectedId);
      } catch (_) {
        return null;
      }
    },
    error: (_, __) => null,
    loading: () => null,
  );
});
