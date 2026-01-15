import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/features/visits/controllers/visit_controller.dart';
import 'visit_add_screen.dart';
import 'visit_detail_screen.dart';

class VisitListScreen extends ConsumerWidget {
  const VisitListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visitsAsync = ref.watch(visitListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Doctor Visits')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const VisitAddScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: visitsAsync.when(
        data: (visits) {
          if (visits.isEmpty) {
            return _buildEmptyState();
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: visits.length,
            itemBuilder: (context, index) {
              final visit = visits[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => VisitDetailScreen(visit: visit)));
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.medical_services, color: AppColors.primary),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    visit.doctorName,
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  if (visit.hospital != null) ...[
                                    const SizedBox(height: 4),
                                    Text(
                                      visit.hospital!,
                                      style: const TextStyle(fontSize: 16, color: AppColors.textSecondary),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            Text(
                              DateFormat('MMM d').format(visit.visitDate),
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                            ),
                          ],
                        ),
                        if (visit.notes != null) ...[
                          const SizedBox(height: 12),
                          const Divider(),
                          const SizedBox(height: 8),
                          Text(
                            visit.notes!,
                            style: const TextStyle(color: AppColors.textSecondary, fontStyle: FontStyle.italic),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                        if (visit.followUpDate != null) ...[
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.warning.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.event_available, size: 16, color: AppColors.textPrimary),
                                const SizedBox(width: 8),
                                Text(
                                  'Follow-up: ${DateFormat('MMM d').format(visit.followUpDate!)}',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.monitor_heart_outlined, size: 80, color: AppColors.textHint),
          SizedBox(height: 16),
          Text(
            'No visits recorded',
            style: TextStyle(fontSize: 20, color: AppColors.textSecondary),
          ),
          SizedBox(height: 8),
          Text(
            'Tap + to add a doctor visit',
            style: TextStyle(color: AppColors.textHint),
          ),
        ],
      ),
    );
  }
}
