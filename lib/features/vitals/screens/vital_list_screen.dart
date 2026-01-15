import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/features/vitals/controllers/vital_controller.dart';
import 'vital_add_screen.dart';

class VitalListScreen extends ConsumerWidget {
  const VitalListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vitalsAsync = ref.watch(vitalListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Vitals Tracking')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const VitalAddScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: vitalsAsync.when(
        data: (vitals) {
          if (vitals.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.monitor_heart_outlined, size: 80, color: AppColors.textHint),
                  SizedBox(height: 16),
                  Text('No vitals logged', style: TextStyle(color: AppColors.textSecondary, fontSize: 18)),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: vitals.length,
            itemBuilder: (context, index) {
              final vital = vitals[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _getColorForType(vital.type).withOpacity(0.1),
                    child: Icon(_getIconForType(vital.type), color: _getColorForType(vital.type)),
                  ),
                  title: Text(vital.type, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(DateFormat('MMM d, h:mm a').format(vital.recordedAt)),
                  trailing: Text(
                    _formatValue(vital),
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 18,
                      color: _getColorForType(vital.type),
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

  String _formatValue(dynamic vital) {
    if (vital.value2 != null) {
      return '${vital.value1.toInt()}/${vital.value2!.toInt()} ${vital.unit}';
    }
    return '${vital.value1} ${vital.unit}';
  }
  
  IconData _getIconForType(String type) {
    switch (type) {
      case 'Blood Pressure': return Icons.favorite;
      case 'Heart Rate': return Icons.monitor_heart;
      case 'Weight': return Icons.monitor_weight;
      case 'Temperature': return Icons.thermostat;
      default: return Icons.timeline;
    }
  }

  Color _getColorForType(String type) {
    switch (type) {
      case 'Blood Pressure': return Colors.red;
      case 'Heart Rate': return Colors.pink;
      case 'Weight': return Colors.blue;
      case 'Temperature': return Colors.orange;
      default: return AppColors.primary;
    }
  }
}
