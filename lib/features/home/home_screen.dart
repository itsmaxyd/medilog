import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../profiles/controllers/profile_controller.dart';
import '../profiles/screens/profile_list_screen.dart';
import '../conditions/screens/condition_list_section.dart';
import '../visits/screens/visit_list_screen.dart';
import '../ocr/screens/scan_screen.dart';
import '../reports/screens/report_list_screen.dart';
import '../reminders/screens/reminder_list_screen.dart';
import '../insurance/screens/insurance_list_screen.dart';
import '../vitals/screens/vital_list_screen.dart';
import '../period/screens/period_list_screen.dart';
import '../tips/screens/health_tips_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(selectedProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MediLog'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
             backgroundColor: Colors.white,
             child: Text(profile?.emoji ?? '', style: const TextStyle(fontSize: 20)),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.switch_account),
            tooltip: 'Switch Profile',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ProfileListScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hello, ${profile?.name ?? "User"}!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            
            // Health Conditions Section
            const ConditionListSection(),
            const SizedBox(height: 24),
            
            // Quick Actions
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: _buildQuickActions(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Quick Actions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        // Row 1
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                context, 
                icon: Icons.personal_injury,
                label: 'Doctor\nVisits',
                color: Colors.blue.shade100,
                iconColor: Colors.blue.shade800,
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (_) => const VisitListScreen()));
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildActionCard(
                context, 
                icon: Icons.document_scanner,
                label: 'Scan\nReport',
                color: Colors.purple.shade100,
                iconColor: Colors.purple.shade800,
                onTap: () async {
                   final text = await Navigator.push(context, MaterialPageRoute(builder: (_) => const ScanScreen()));
                   if (text != null && context.mounted) {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                       content: Text('Scanned: ${text.toString().substring(0, 30)}...'),
                     ));
                   }
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildActionCard(
                context, 
                icon: Icons.assignment_turned_in,
                label: 'Tests &\nReports',
                color: Colors.orange.shade100,
                iconColor: Colors.orange.shade800,
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (_) => const ReportListScreen()));
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Row 2
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                context, 
                icon: Icons.access_alarm,
                label: 'Reminders',
                color: Colors.pink.shade100,
                iconColor: Colors.pink.shade800,
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (_) => const ReminderListScreen()));
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildActionCard(
                context, 
                icon: Icons.monitor_heart,
                label: 'Vitals\nLog',
                color: Colors.red.shade100,
                iconColor: Colors.red.shade800,
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (_) => const VitalListScreen()));
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildActionCard(
                context, 
                icon: Icons.health_and_safety,
                label: 'Insurance',
                color: Colors.teal.shade100,
                iconColor: Colors.teal.shade800,
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (_) => const InsuranceListScreen()));
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Row 3
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                context, 
                icon: Icons.water_drop,
                label: 'Period\nTracker',
                color: Colors.pink.shade50,
                iconColor: Colors.pink.shade400,
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (_) => const PeriodListScreen()));
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildActionCard(
                context, 
                icon: Icons.lightbulb,
                label: 'Health\nTips',
                color: Colors.yellow.shade100,
                iconColor: Colors.orange.shade800,
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (_) => const HealthTipsScreen()));
                },
              ),
            ),
            const SizedBox(width: 16),
            const Spacer(),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard(BuildContext context, {
    required IconData icon, 
    required String label, 
    required Color color, 
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      color: color,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(icon, size: 40, color: iconColor),
              const SizedBox(height: 12),
              Text(
                label, 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
