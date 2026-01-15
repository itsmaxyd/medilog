import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/elderly_theme.dart';
import 'features/profiles/screens/profile_list_screen.dart';

class MediLogApp extends ConsumerWidget {
  const MediLogApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'MediLog',
      theme: ElderlyTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: const ProfileListScreen(), 
    );
  }
}
