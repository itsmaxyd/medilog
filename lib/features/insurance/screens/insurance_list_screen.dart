import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/features/insurance/controllers/insurance_controller.dart';
import 'insurance_add_screen.dart';

class InsuranceListScreen extends ConsumerWidget {
  const InsuranceListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final insuranceAsync = ref.watch(insuranceListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Health Insurance')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const InsuranceAddScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: insuranceAsync.when(
        data: (insurances) {
          if (insurances.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.health_and_safety_outlined, size: 80, color: AppColors.textHint),
                  SizedBox(height: 16),
                  Text('No insurance policies added', style: TextStyle(color: AppColors.textSecondary, fontSize: 18)),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: insurances.length,
            itemBuilder: (context, index) {
              final insurance = insurances[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            insurance.providerName,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_outline, color: AppColors.textHint),
                            onPressed: () {
                               // Assuming delete logic
                               ref.read(insuranceListProvider.notifier).deleteInsurance(insurance.id);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('Policy #: ${insurance.policyNumber}', style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 8),
                      if (insurance.validUntil != null)
                        Text('Valid Until: ${DateFormat.yMMMd().format(insurance.validUntil!)}', style: const TextStyle(color: AppColors.textSecondary)),
                      
                      if (insurance.contactNumber != null) ...[
                         const SizedBox(height: 8),
                         Row(
                           children: [
                             const Icon(Icons.phone, size: 16, color: AppColors.primary),
                             const SizedBox(width: 8),
                             Text(insurance.contactNumber!, style: const TextStyle(fontWeight: FontWeight.bold)),
                           ],
                         ),
                      ],
                    ],
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
}
