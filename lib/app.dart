import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/elderly_theme.dart';
import 'features/profiles/screens/profile_list_screen.dart';

import 'package:medilog/providers/theme_provider.dart';
import 'package:medilog/providers/providers.dart';

class MediLogApp extends ConsumerStatefulWidget {
  const MediLogApp({super.key});

  @override
  ConsumerState<MediLogApp> createState() => _MediLogAppState();
}

class _MediLogAppState extends ConsumerState<MediLogApp> {
  @override
  void initState() {
    super.initState();
    // Initialize notifications after the UI is up
    WidgetsBinding.instance.addPostFrameCallback((_) async {
       final notificationService = ref.read(notificationServiceProvider);
       await notificationService.init();
       await notificationService.requestPermissions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'MediLog',
      theme: ElderlyTheme.themeData,
      darkTheme: ElderlyTheme.darkThemeData,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: const ProfileListScreen(), 
    );
  }
}
