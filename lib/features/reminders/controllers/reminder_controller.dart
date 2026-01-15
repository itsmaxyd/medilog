import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:medilog/data/database/database.dart';
import 'package:medilog/providers/providers.dart';
import '../../profiles/controllers/profile_controller.dart';
import '../../../services/notification_service.dart';

class ReminderListController extends AsyncNotifier<List<Reminder>> {
  @override
  FutureOr<List<Reminder>> build() {
    final selectedProfileId = ref.watch(selectedProfileIdProvider);
    if (selectedProfileId == null) {
      return [];
    }
    return ref.watch(reminderRepositoryProvider).getRemindersForProfile(selectedProfileId);
  }

  Future<void> addReminder({
    required String title,
    String? description,
    required DateTime scheduledAt,
    required String type, // 'Medicine', 'General'
    String? repeatPattern,
  }) async {
    final selectedProfileId = ref.read(selectedProfileIdProvider);
    if (selectedProfileId == null) return;

    final repo = ref.read(reminderRepositoryProvider);
    final notificationService = ref.read(notificationServiceProvider);
    
    state = const AsyncValue.loading();
    
    state = await AsyncValue.guard(() async {
      final id = await repo.addReminder(
        RemindersCompanion(
          profileId: Value(selectedProfileId),
          title: Value(title),
          description: Value(description),
          scheduledAt: Value(scheduledAt),
          type: Value(type),
          repeatPattern: Value(repeatPattern),
          isActive: const Value(true),
        ),
      );
      
      // Schedule Notification
      await notificationService.scheduleNotification(
        id: id, // Use DB ID as notification ID
        title: title,
        body: description ?? 'It\'s time for your $type',
        scheduledDate: scheduledAt,
      );
      
      return repo.getRemindersForProfile(selectedProfileId);
    });
  }

  Future<void> deleteReminder(int id) async {
    final selectedProfileId = ref.read(selectedProfileIdProvider);
    if (selectedProfileId == null) return;

    final repo = ref.read(reminderRepositoryProvider);
    final notificationService = ref.read(notificationServiceProvider);
    
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await repo.deleteReminder(id);
      await notificationService.cancelNotification(id);
      return repo.getRemindersForProfile(selectedProfileId);
    });
  }
}

final reminderListProvider = AsyncNotifierProvider<ReminderListController, List<Reminder>>(() {
  return ReminderListController();
});
