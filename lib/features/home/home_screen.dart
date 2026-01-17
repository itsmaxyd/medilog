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
import '../../data/database/database.dart';
import '../../providers/theme_provider.dart';
import '../../providers/providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(selectedProfileProvider);
    final themeMode = ref.watch(themeModeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

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
          // Dark Mode Toggle
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            tooltip: isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
            onPressed: () {
               ref.read(themeModeProvider.notifier).state = 
                 isDarkMode ? ThemeMode.light : ThemeMode.dark;
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'switch_profile') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileListScreen()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'switch_profile',
                  child: Row(
                    children: [
                       Icon(Icons.switch_account, color: Colors.black54),
                       SizedBox(width: 8),
                       Text('Switch Profile'),
                    ],
                  ),
                ),
              ];
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
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text('Quick Actions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                   const SizedBox(height: 16),
                   _buildQuickActionsGrid(context, profile),
                 ],
               ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionsGrid(BuildContext context, Profile? profile) {
    final actions = [
      _ActionItem(
        icon: Icons.personal_injury,
        label: 'Doctor\nVisits',
        color: Colors.blue.shade100,
        iconColor: Colors.blue.shade800,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VisitListScreen())),
      ),
      _ActionItem(
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
      _ActionItem(
        icon: Icons.assignment_turned_in,
        label: 'Tests &\nReports',
        color: Colors.orange.shade100,
        iconColor: Colors.orange.shade800,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ReportListScreen())),
      ),
      _ActionItem(
        icon: Icons.access_alarm,
        label: 'Reminders',
        color: Colors.pink.shade100,
        iconColor: Colors.pink.shade800,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ReminderListScreen())),
      ),
      _ActionItem(
        icon: Icons.monitor_heart,
        label: 'Vitals\nLog',
        color: Colors.red.shade100,
        iconColor: Colors.red.shade800,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VitalListScreen())),
      ),
      _ActionItem(
        icon: Icons.health_and_safety,
        label: 'Insurance',
        color: Colors.teal.shade100,
        iconColor: Colors.teal.shade800,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const InsuranceListScreen())),
      ),
      if (profile?.sex != 'Male')
        _ActionItem(
          icon: Icons.water_drop,
          label: 'Period\nTracker',
          color: Colors.pink.shade50,
          iconColor: Colors.pink.shade400,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PeriodListScreen())),
        ),
      _ActionItem(
        icon: Icons.lightbulb,
        label: 'Health\nTips',
        color: Colors.yellow.shade100,
        iconColor: Colors.orange.shade800,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HealthTipsScreen())),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final item = actions[index];
        return _buildActionCard(context, item);
      },
    );
  }

  Widget _buildActionCard(BuildContext context, _ActionItem item) {
    return Card(
      elevation: 0,
      color: item.color,
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 36, color: item.iconColor),
              const SizedBox(height: 8),
              Text(
                item.label, 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14, 
                  fontWeight: FontWeight.bold,
                  color: item.iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class _ActionItem {
  final IconData icon;
  final String label;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;

  _ActionItem({required this.icon, required this.label, required this.color, required this.iconColor, required this.onTap});
}
