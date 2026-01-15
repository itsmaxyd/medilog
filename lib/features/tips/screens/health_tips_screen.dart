import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medilog/core/constants/app_colors.dart';
import 'package:medilog/features/tips/controllers/health_tip_controller.dart';

class HealthTipsScreen extends ConsumerWidget {
  const HealthTipsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tipsAsync = ref.watch(healthTipsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Health Tips')),
      body: tipsAsync.when(
        data: (tips) {
          if (tips.isEmpty) {
            return const Center(child: Text('No tips available'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: tips.length,
            itemBuilder: (context, index) {
              final tip = tips[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              tip.title,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(tip.category, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.accent)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(tip.content, style: const TextStyle(fontSize: 16, height: 1.4)),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Source: ${tip.source}',
                          style: const TextStyle(fontSize: 12, color: AppColors.textHint, fontStyle: FontStyle.italic),
                        ),
                      ),
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
