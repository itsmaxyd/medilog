import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medilog/data/database/database.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/features/visits/controllers/visit_detail_controller.dart';
import 'package:medilog/features/visits/screens/prescription_add_screen.dart';

class VisitDetailScreen extends ConsumerWidget {
  final DoctorVisit visit;

  const VisitDetailScreen({required this.visit, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prescriptionsAsync = ref.watch(visitPrescriptionsProvider(visit.id));

    return Scaffold(
      appBar: AppBar(title: const Text('Visit Details')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PrescriptionAddScreen(visitId: visit.id)),
          );
          if (result == true) {
            ref.invalidate(visitPrescriptionsProvider(visit.id));
          }
        },
        label: const Text('Add Rx'),
        icon: const Icon(Icons.add_circle_outline),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Visit Info Header
            Container(
              color: AppColors.primary,
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    visit.doctorName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.white70, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        DateFormat('EEEE, MMM d, yyyy').format(visit.visitDate),
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  if (visit.hospital != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.local_hospital, color: Colors.white70, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          visit.hospital!,
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            
            // Notes Section
            if (visit.notes != null && visit.notes!.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('CONSULTATION NOTES', style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    )),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Text(
                        visit.notes!,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            
            // Prescriptions Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('PRESCRIPTIONS', style: TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  )),
                  const SizedBox(height: 16),
                  
                  prescriptionsAsync.when(
                    data: (prescriptions) {
                      if (prescriptions.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              children: [
                                Icon(Icons.medication_outlined, size: 48, color: Colors.grey.shade300),
                                const SizedBox(height: 16),
                                const Text('No medicines added yet', style: TextStyle(color: AppColors.textHint)),
                              ],
                            ),
                          ),
                        );
                      }
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: prescriptions.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          final rx = prescriptions[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.medication, color: AppColors.primary, size: 20),
                            ),
                            title: Text(
                              rx.medicineName,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(rx.dosage, style: const TextStyle(fontWeight: FontWeight.w500)),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(rx.frequency),
                                  ],
                                ),
                                if (rx.durationDays != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text('For ${rx.durationDays} days', style: const TextStyle(color: AppColors.textSecondary)),
                                  ),
                                if (rx.notes != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text('Note: ${rx.notes}', style: const TextStyle(fontStyle: FontStyle.italic)),
                                  ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    loading: () => const Center(child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    )),
                    error: (err, _) => Text('Error: $err'),
                  ),
                  
                  const SizedBox(height: 100), // Spacing for FAB
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
