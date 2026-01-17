import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'services/notification_service.dart';
import 'providers/providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Services are now initialized inside the app or providers to prevent splash screen delay
  
  runApp(
    const ProviderScope(
      child: MediLogApp(),
    ),
  );
}
