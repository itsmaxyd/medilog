import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/features/period/controllers/period_controller.dart';
import 'period_add_screen.dart';

class PeriodListScreen extends ConsumerWidget {
  const PeriodListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final periodsAsync = ref.watch(periodListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Period Tracker'),
        backgroundColor: Colors.pink.shade50,
        foregroundColor: Colors.pink.shade900,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink.shade400,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const PeriodAddScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: periodsAsync.when(
        data: (entries) {
          if (entries.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.water_drop_outlined, size: 80, color: Colors.pink.shade100),
                  const SizedBox(height: 16),
                  const Text('No logs found', style: TextStyle(color: AppColors.textSecondary, fontSize: 18)),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: entries.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final entry = entries[index];
              final duration = entry.endDate != null 
                  ? entry.endDate!.difference(entry.startDate).inDays + 1
                  : null;
                  
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink.shade100,
                  child: const Icon(Icons.water_drop, color: Colors.pink),
                ),
                title: Text(
                  DateFormat('MMMM d, yyyy').format(entry.startDate),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (entry.endDate != null)
                      Text('Ended: ${DateFormat('MMMM d').format(entry.endDate!)} ($duration days)'),
                    
                    Row(
                      children: [
                        if (entry.flowIntensity != null)
                          Text('${entry.flowIntensity} flow'),
                        if (entry.flowIntensity != null && entry.mood != null)
                          const Text(' • '),
                         if (entry.mood != null)
                          Text(entry.mood!),
                      ],
                    ),
                  ],
                ),
                trailing: entry.isPainful 
                  ? const Tooltip(message: 'Painful', child: Icon(Icons.bolt, color: Colors.orange)) 
                  : null,
                onTap: () {
                   // TODO: Edit
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
