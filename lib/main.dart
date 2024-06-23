import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './demo2_provider/setup_providers.dart';
import './demo2_provider/provider_home_Screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: setupProviders(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProviderHomeScreen(),
    );
  }
}
